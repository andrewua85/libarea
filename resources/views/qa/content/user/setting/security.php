<?php
$form = new Forms();
$form->html_form($user['trust_level'], Config::get('form/user-security'));
?>
<main class="col-span-9 mb-col-12">
  <?= Tpl::import('/content/user/setting/nav', ['data' => $data]); ?>

  <div class="box-white">
    <form action="<?= getUrlByName('setting.security.edit'); ?>" method="post">
      <?php csrf_field(); ?>

      <?= $form->build_form(); ?>

      <fieldset>
        <input type="hidden" name="nickname" id="nickname" value="">
        <?= sumbit(Translate::get('edit')); ?>
      </fieldset>
    </form>
  </div>
</main>
<?= Tpl::import('/_block/sidebar/lang', ['lang' => Translate::get('info-security')]); ?>