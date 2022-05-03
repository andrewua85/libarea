<?php

namespace App\Controllers;

use Hleb\Scheme\App\Controllers\MainController;
use App\Models\HomeModel;
use Config, Tpl, UserData, Meta, Language, Translate;

class HomeController extends MainController
{
    protected $limit = 25;

    private $user;

    public function __construct()
    {
        $this->user  = UserData::get();
    }

    public function index($sheet, $type)
    { 
        $pageNumber   = Tpl::pageNumber();

        if ($sheet == 'main.deleted' && !UserData::checkAdmin()) {
            redirect('/');
        }

        $latest_answers = HomeModel::latestAnswers($this->user);
        $topics_user    = HomeModel::subscription($this->user['id']);
        $pagesCount     = HomeModel::feedCount($topics_user, $this->user, $sheet);
        $posts          = HomeModel::feed($pageNumber, $this->limit, $topics_user, $this->user, $sheet);

        $topics = [];
        if (count($topics_user) == 0) {
            $topics = \App\Models\FacetModel::advice($this->user['id']);
        }

        $title = __('meta.' . $sheet . '.title', ['name' => config('meta.name')]);
        $description = __('meta.' . $sheet . '.desc', ['name' => config('meta.name')]);

        $m = [
            'main'      => 'main',
            'og'        => true,
            'imgurl'    => config('meta.img_path'),
            'url'       => $sheet == 'top' ? '/top' : '/',
        ];

        return Tpl::LaRender(
            '/home',
            [
                'meta'  => Meta::get($title, $description, $m),
                'data'  => [
                    'pagesCount'        => ceil($pagesCount / $this->limit),
                    'pNum'              => $pageNumber,
                    'sheet'             => $sheet,
                    'type'              => $type,
                    'latest_answers'    => $latest_answers,
                    'topics_user'       => $topics_user,
                    'posts'             => $posts,
                    'topics'            => $topics,
                ],
            ],
        );
    }

    // Infinite scroll
    // Бесконечный скролл
    public function scroll()
    {
        $pageNumber = Tpl::pageNumber();
        $topics_user    = HomeModel::subscription($this->user['id']);
        $posts          = HomeModel::feed($pageNumber, $this->limit, $topics_user, $this->user, 'main.feed');

        Tpl::insert(
            '/content/post/postscroll',
            [
                'user'  => $this->user,
                'data'  => [
                    'pages' => $pageNumber,
                    'sheet' => 'main.feed',
                    'posts' => $posts,

                ]
            ]
        );
    }
}
