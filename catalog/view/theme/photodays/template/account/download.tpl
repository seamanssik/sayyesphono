<?php echo $header; ?>
  <div class="container">
    <div class="row">
      <?php echo $column_right; ?>
    </div>
    <div class="account-heading">
      <div class="h1"><?php echo $heading_title; ?></div>
      <ul class="breadcrumb account-breadcrumb h1-after">
        <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
          <?php if($i+1<count($breadcrumbs)) { ?><li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><l/i> <?php } else { ?><li class="active"><span><?php echo $breadcrumb['text']; ?></span></li><?php } ?>
        <?php } ?>
      </ul>
    </div>
    <div class="row row-account">
      <div class="col-ed-8 col-lg-9 col-md-9 col-sm-9">
<!--        <div class="h3"><span>Фотосессии</span></div>-->
        <br>
        <table class="table table-bordered account-form">
          <thead>
          <tr>
            <td class="text-left">Дата добавления</td>
            <td class="text-left">Название</td>
            <td class="text-left">Ссылка</td>
          </tr>
          </thead>
          <tbody>
          <?php if ($histories) { ?>
            <?php foreach ($histories as $history) { ?>
              <tr>
                <td class="text-left"><?php echo $history['date_added']; ?></td>
                <td class="text-left"><?php echo $history['title']; ?></td>
                <td class="text-left"><a href="<?php echo $history['comment']; ?>" target="_blank">Скачать фотосессию</a></td>
              </tr>
            <?php } ?>
          <?php } else { ?>
            <tr>
              <td class="text-center" colspan="3"><?php echo $text_empty; ?></td>
            </tr>
          <?php } ?>
          </tbody>
        </table>
      </div>
      <div class="col-ed-2 visible-ed"></div>
    </div>
  </div>
<?php echo $footer; ?>
<?php /* ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $heading_title; ?></h2>
      <?php if ($downloads) { ?>
      <div class="table-responsive">
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-right"><?php echo $column_order_id; ?></td>
            <td class="text-left"><?php echo $column_name; ?></td>
            <td class="text-left"><?php echo $column_size; ?></td>
            <td class="text-left"><?php echo $column_date_added; ?></td>
            <td></td>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($downloads as $download) { ?>
          <tr>
            <td class="text-right"><?php echo $download['order_id']; ?></td>
            <td class="text-left"><?php echo $download['name']; ?></td>
            <td class="text-left"><?php echo $download['size']; ?></td>
            <td class="text-left"><?php echo $download['date_added']; ?></td>
            <td><a href="<?php echo $download['href']; ?>" data-toggle="tooltip" title="<?php echo $button_download; ?>" class="btn btn-primary"><i class="fa fa-cloud-download"></i></a></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php */ ?>