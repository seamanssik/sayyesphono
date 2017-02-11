<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <?php /* ?><a href="#" onclick="getTopicReviews(0); return false;" class="btn btn-info">Добавить раздел</a>
        <a href="#" onclick="listTopicReviews(); return false;" class="btn btn-warning">Разделы FAQ</a><?php */ ?>
        <a onclick="location = '<?php echo $insert; ?>'" data-toggle="tooltip" title="Добавить вопрос" class="btn btn-primary"><i class="fa fa-check"></i></a>
        <a onclick="$('#form').submit();" class="btn btn-danger"><i class="fa fa-times"></i></a>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
      <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
          <table  id="module" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
              <td width="1" align="center"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left">Автор</td>
              <td class="left" style="width:50%">Отзыв</td>
              <td class="right"><?php echo $column_status; ?></td>
              <td class="right"><?php echo $column_sort_order; ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
            </thead>
            <tbody>
            <?php if ($topics) { ?>
              <?php $class = 'odd'; ?>
              <?php foreach ($topics as $topic) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <tr class="<?php echo $class; ?>">
                  <td style="align: center;"><?php if ($topic['selected']) { ?>
                      <input type="checkbox" name="selected[]" value="<?php echo $topic['faq_id']; ?>" checked="checked" />
                    <?php } else { ?>
                      <input type="checkbox" name="selected[]" value="<?php echo $topic['faq_id']; ?>" />
                    <?php } ?></td>
                  <td class="left"><?php echo $topic['author_name']; ?></td>
                  <td class="left"><?php echo $topic['description']; ?></td>
                  <td class="right"><?php echo $topic['status']; ?></td>
                  <td class="right"><?php echo $topic['sort_order']; ?></td>
                  <td class="right"><?php foreach ($topic['action'] as $action) { ?>
                      <a href="<?php echo $action['href']; ?>" class="btn btn-primary">Редактировать</a>
                    <?php } ?></td>
                </tr>
              <?php } ?>
            <?php } else { ?>
              <tr class="even">
                <td class="center" colspan="5"><?php echo $text_no_results; ?></td>
              </tr>
            <?php } ?>
            </tbody>
          </table>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>