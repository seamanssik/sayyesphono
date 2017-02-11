<div class="table-responsive">
  <table class="table table-bordered">
    <thead>
      <tr>
        <td class="text-left"><?php echo $column_date_added; ?></td>
        <td class="text-left">Название<?php // echo $column_date_added; ?></td>
        <td class="text-left">Ссылка<?php // echo $column_comment; ?></td>
        <td class="text-left">Действие</td>
      </tr>
    </thead>
    <tbody>
      <?php if ($histories) { ?>
      <?php foreach ($histories as $history) { ?>
      <tr>
        <td class="text-left"><?php echo $history['date_added']; ?></td>
        <td class="text-left"><?php echo $history['title']; ?></td>
        <td class="text-left"><?php echo $history['comment']; ?></td>
        <td class="text-left"><button id="button-historyDelete" data-history-id="<?php echo $history['history_id']; ?>" data-loading-text="Загрузка..." class="btn btn-danger"><i class="fa fa-trash"></i> Удалить</button></td>
      </tr>
      <?php } ?>
      <?php } else { ?>
      <tr>
        <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
      </tr>
      <?php } ?>
    </tbody>
  </table>
</div>
<div class="row">
  <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
  <div class="col-sm-6 text-right"><?php echo $results; ?></div>
</div>
