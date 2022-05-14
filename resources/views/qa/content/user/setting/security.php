<?php
$form = new Forms();
$form->html_form(UserData::getUserTl(), config('form/user-security'));
?>
<main class="col-two">
  <?= insert('/content/user/setting/nav', ['data' => $data]); ?>

  <div class="box">
    <form action="<?= url('setting.security.edit'); ?>" method="post">
      <?php csrf_field(); ?>

      <?= $form->build_form(); ?>

      <fieldset>
        <input type="hidden" name="nickname" id="nickname" value="">
        <?= Html::sumbit(__('app.edit')); ?>
      </fieldset>
    </form>
  </div>
</main>
<aside>
  <div class="box bg-violet text-sm">
    <?= __('help.security_info'); ?>
  </div>
</aside>