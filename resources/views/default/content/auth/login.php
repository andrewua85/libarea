<?php
$form = new Forms();
$form->html_form(UserData::getUserTl(), config('form/auth.login'));
?>

<main class="max-w780 mr-auto box">
  <h1 class="center"><?= __('app.authorization'); ?></h1>
  <form class="max-w300" action="<?= url('login'); ?>" method="post">
    <?php csrf_field(); ?>

    <?= $form->build_form(); ?>

    <fieldset>
      <?= Html::sumbit(__('app.sign_in')); ?>
      <?php if (config('general.invite') == false) : ?>
        <a class="ml20 text-sm" href="<?= url('register'); ?>"><?= __('app.registration'); ?></a>
      <?php endif; ?>
      <a class="ml20 text-sm" href="<?= url('recover'); ?>"><?= __('app.forgot_password'); ?>?</a>
    </fieldset>
  </form>
  <?php if (config('general.invite') == 1) : ?>
    <?= __('app.invate_text'); ?>
  <?php endif; ?>
  <p><?= __('app.agree_rules'); ?>.</p>
  <p><?= __('app.login_info'); ?></p>
</main>