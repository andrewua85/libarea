<main>
  <?= Tpl::insert('/content/user/favorite/nav', ['data' => $data]); ?>
  <div class="mt10">
    <?= Tpl::insert('/content/post/post', ['data' => $data]); ?>
  </div>
</main>
<aside>
  <div class="box text-sm sticky top-sm">
    <?= __('app.preferences_info'); ?>
  </div>
</aside>