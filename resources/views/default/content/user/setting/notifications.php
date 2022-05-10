<?php
$form = new Forms();
$form->adding(['name' => 'setting_email_pm', 'type' => 'selected', 'var' => $data['setting']['setting_email_pm'] ?? 0]);
$form->adding(['name' => 'setting_email_appealed', 'type' => 'selected', 'var' => $data['setting']['setting_email_appealed'] ?? 0]);
$form->html_form(UserData::getUserTl(), config('form/user-notifications'));
?>

<main>
  <?= Tpl::insert('/content/user/setting/nav', ['data' => $data]); ?>

  <div class="box">
    <form action="<?= url('setting.notif.edit'); ?>" method="post">
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
  <div class="box text-sm">
    <?= __('help.notification_info'); ?>
  </div>
</aside>