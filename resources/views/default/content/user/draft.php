<main>
  <div class="indent-body">
    <div class="mb15">
      <ul class="nav">
        <li class="active"><?= __('app.drafts'); ?></li>
      </ul>
    </div>
    <?php if (!empty($data['drafts'])) : ?>
      <?php foreach ($data['drafts'] as $draft) : ?>
        <div class="box bg-lightgray">
          <a href="<?= post_slug($draft['post_id'], $draft['post_slug']); ?>">
            <h3 class="text-2xl m0"><?= $draft['post_title']; ?></h3>
          </a>
          <div class="mr5 text-sm gray-600 lowercase">
            <?= Html::langDate($draft['post_date']); ?>
          </div>
        </div>
      <?php endforeach; ?>
    <?php else : ?>
      <?= insert('/_block/no-content', ['type' => 'max', 'text' => __('app.no_content'), 'icon' => 'post']); ?>
    <?php endif; ?>
  </div>
</main>
<aside>
  <div class="box bg-beige sticky top-sm">
    <?= __('help.draft_info'); ?>
  </div>
</aside>