<?php

namespace Modules\Catalog\App;

use Hleb\Constructor\Handlers\Request;
use Modules\Catalog\App\Models\{WebModel, UserAreaModel};
use Config, Translate, UserData, Meta;

class Home
{
    private $user;

    protected $limit = 15;

    public function __construct()
    {
        $this->user  = UserData::get();
    }

    public function index($sheet, $type)
    {
        $page   = Request::getInt('page');
        $page   = $page == 0 ? 1 : $page;

        $limit = 10;
        $pagesCount = 1;
        if ($sheet == 'web.deleted' || $sheet == 'web.audit') {
            $limit = $this->limit;
            $pagesCount = WebModel::getItemsAllCount($sheet);
        }

        $num = $page > 1 ? sprintf(Translate::get('page.number'), $page) : '';

        $m = [
            'og'         => true,
            'imgurl'     => Config::get('meta.img_path_web'),
            'url'        => getUrlByName($sheet),
        ];

        $count_site = ($this->user['trust_level'] == UserData::REGISTERED_ADMIN) ? 0 : UserAreaModel::getUserSitesCount($this->user['id']);

        return view(
            '/view/default/home',
            [
                'meta'  => Meta::get(Translate::get($sheet . '.home.title'), Translate::get($sheet . '.home.desc'), $m),
                'user'  => $this->user,
                'data'  => [
                    'screening'         => 'cat',
                    'pagesCount'        => ceil($pagesCount / $this->limit),
                    'count'             => $pagesCount,
                    'pNum'              => $page,
                    'items'             => WebModel::getItemsAll($page, $limit, $this->user, $sheet),
                    'user_count_site'   => $count_site,
                    'type'              => $type,
                    'sheet'             => $sheet,
                ]
            ]
        );
    }
}
