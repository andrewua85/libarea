<?= includeTemplate(
  '/view/default/menu',
  [
    'data'  => $data,
    'meta'  => $meta,
    'menus' => [],
  ]
); ?>

<?= includeTemplate('/view/default/user/info'); ?>

<table>
  <thead>
    <th><?= __('admin.device_id'); ?></th>
    <th><?= __('admin.ip'); ?></th>
    <th><?= __('admin.time'); ?></th>
  </thead>
  <?php foreach ($data['results'] as $user) :  ?>
    <tr>
      <td>
        <a href="<?= url('admin.device', ['item' => $user['device_id']]); ?>"><?= $user['device_id']; ?></a>
      </td>
      <td>
	    <a href="<?= url('admin.regip', ['item' => $user['user_ip']]); ?>"><?= $user['user_ip']; ?></a>
      </td>
      <td>
        <?= $user['add_date']; ?>
      </td>
    </tr>
  <?php endforeach; ?>
</table>
</main>
</div>
<?= includeTemplate('/view/default/footer'); ?>