<main>

  <ul class="nav scroll-menu">
    <?= insert('/_block/navigation/nav', ['list' => config('navigation/nav.home')]); ?>
  </ul>

  <?= insert('/content/post/post', ['data' => $data]); ?>

  <?php if (UserData::getUserScroll()) : ?>
    <div id="scrollArea"></div>
    <div id="scroll"></div>
  <?php else : ?>
    <?= Html::pagination($data['pNum'], $data['pagesCount'], $data['sheet'], null); ?>
  <?php endif; ?>
</main>

<aside>
  <?php if (!UserData::checkActiveUser()) : ?>
    <div class="box bg-lightgray text-sm">
      <h4 class="uppercase-box"><?= __('app.authorization'); ?></h4>
      <form class="max-w300" action="<?= url('enterLogin'); ?>" method="post">
        <?php csrf_field(); ?>
        <?= insert('/_block/form/login'); ?>
        <fieldset class="gray-600 center">
          <?= __('app.agree_rules'); ?>
          <a href="<?= url('recover'); ?>"><?= __('app.forgot_password'); ?>?</a>
        </fieldset>
      </form>
    </div>
  <?php endif; ?>

  <?php if (is_array($data['topics'])) : ?>
    <?php if (count($data['topics']) > 0) : ?>
      <div class="box br-lightgray">
        <h4 class="uppercase-box"><?= __('app.recommended'); ?></h4>
        <ul>
          <?php foreach ($data['topics'] as $recomm) : ?>
            <li class="flex justify-between items-center mb10">
              <a class="flex items-center gap-min" href="<?= url('topic', ['slug' => $recomm['facet_slug']]); ?>">
                <?= Img::image($recomm['facet_img'], $recomm['facet_title'], 'img-base', 'logo', 'max'); ?>
                <?= $recomm['facet_title']; ?>
              </a>
              <?php if (UserData::getUserId()) : ?>
                <div data-id="<?= $recomm['facet_id']; ?>" data-type="facet" class="focus-id right inline text-sm red center">
                  <?= __('app.read'); ?>
                </div>
              <?php endif; ?>
            </li>
          <?php endforeach; ?>
        </ul>
      </div>
    <?php endif; ?>
  <?php endif; ?>

  <div class="sticky top-sm">
    <?= insert('/_block/latest-comments-tabs', ['latest_comments' => $data['latest_comments']]); ?>

    <?php if (UserData::getUserScroll()) : ?>
      <?= insert('/global/sidebar-footer'); ?>
    <?php endif; ?>
  </div>
</aside>