<?php echo $header; ?>
  <div class="heading-background no_margin">
    <div class="container">
      <div class="h1"><?php echo $heading_title; ?></div>
      <ul class="breadcrumb h1-after">
        <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
          <?php if($i+1<count($breadcrumbs)) { ?><li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><l/i> <?php } else { ?><li class="active"><span><?php echo $breadcrumb['text']; ?></span></li><?php } ?>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="heading-form">
    <div class="container heading-form__container">
      <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
      <?php } ?>
      <form action="<?php echo $action; ?>" id="form-login" method="post" enctype="multipart/form-data" class="form-horizontal" autocomplete="off">
        <legend><?php echo $text_email; ?></legend>
        <div class="form-group js-animate">
          <label class="col-sm-12 control-label" for="input-email">*<?php echo $text_your_email; ?>:</label>
          <div class="col-sm-12">
            <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php // echo $entry_email; ?>" id="input-email" class="form-control" />
          </div>
        </div>
        <div class="buttons text-center">
          <button type="submit" class="js-animate"><span><?php echo $button_continue; ?></span></button>
        </div>
      </form>
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
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
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
      <h1><?php echo $heading_title; ?></h1>
      <p><?php echo $text_email; ?></p>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <legend><?php echo $text_your_email; ?></legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-10">
              <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
            </div>
          </div>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
          <div class="pull-right">
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
          </div>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php */ ?>