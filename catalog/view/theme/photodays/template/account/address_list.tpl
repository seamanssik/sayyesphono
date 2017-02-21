<?php echo $header; ?>
  <div class="container">
    <div class="account-heading">
      <div class="h1"><?php echo $heading_title; ?></div>
      <ul class="breadcrumb account-breadcrumb h1-after">
        <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
          <?php if($i+1<count($breadcrumbs)) { ?><li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><l/i> <?php } else { ?><li class="active"><span><?php echo $breadcrumb['text']; ?></span></li><?php } ?>
        <?php } ?>
      </ul>
    </div>
    <div class="row row-account">
      <div class="col-lg-10 col-md-9 col-sm-8">
<!--        --><?php //if ($success) { ?>
<!--          <div class="alert alert-success"><i class="fa fa-check-circle"></i> --><?php //echo $success; ?><!--</div>-->
<!--        --><?php //} ?>
<!--        --><?php //if ($error_warning) { ?>
<!--          <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> --><?php //echo $error_warning; ?><!--</div>-->
<!--        --><?php //} ?>
        <?php if ($addresses) { ?>
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <?php foreach ($addresses as $result) { ?>
                <tr>
                  <td class="text-left"><?php echo $result['address']; ?></td>
                  <td class="text-right">
                    <a href="<?php echo $result['update']; ?>" class="btn__info"><?php echo $button_edit; ?></a>
                  </td>
                </tr>
              <?php } ?>
            </table>
          </div>
        <?php } else { ?>
          <p><?php echo $text_empty; ?></p>
        <?php } ?>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="<?php echo $back; ?>" class="btn__default"><?php echo $button_back; ?></a></div>
        </div>
      </div>
      <?php echo $column_right; ?>
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
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $text_address_book; ?></h2>
      <?php if ($addresses) { ?>
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <?php foreach ($addresses as $result) { ?>
          <tr>
            <td class="text-left"><?php echo $result['address']; ?></td>
            <td class="text-right"><a href="<?php echo $result['update']; ?>" class="btn btn-info"><?php echo $button_edit; ?></a> &nbsp; <a href="<?php echo $result['delete']; ?>" class="btn btn-danger"><?php echo $button_delete; ?></a></td>
          </tr>
          <?php } ?>
        </table>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
        <div class="pull-right"><a href="<?php echo $add; ?>" class="btn btn-primary"><?php echo $button_new_address; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php */ ?>