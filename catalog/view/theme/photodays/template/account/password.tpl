<?php echo $header; ?>
<?php echo $column_right; ?>
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
      <div class="col-ed-8 col-lg-9 col-md-9 col-sm-9">
<!--        <div class="h3"><span>Изменить пароль</span></div>-->
        <br>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="account-form form-horizontal" autocomplete="off">
          <div class="form-group account-form__group required">
            <div class="col-sm-12">
              <label class="control-label account-form__label" for="input-password"><?php echo $entry_password; ?>:</label>
              <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php // echo $entry_password; ?>" id="input-password" class="form-control account-form__control" />
              <?php if ($error_password) { ?>
                <div class="text-danger"><?php echo $error_password; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group account-form__group required">
            <div class="col-sm-12">
              <label class="control-label account-form__label" for="input-confirm"><?php echo $entry_confirm; ?>:</label>
              <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php // echo $entry_confirm; ?>" id="input-confirm" class="form-control account-form__control" />
              <?php if ($error_confirm) { ?>
                <div class="text-danger"><?php echo $error_confirm; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="buttons clearfix">
            <div class="pull-left">
              <a href="<?php echo $back; ?>" class="btn__default"><?php echo $button_back; ?></a>
            </div>
            <div class="pull-right">
              <button type="submit" class="btn__primary"><span><?php echo $button_continue; ?></span></button>
            </div>
          </div>
        </form>
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
      <h1><?php echo $heading_title; ?></h1>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <legend><?php echo $text_password; ?></legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
            <div class="col-sm-10">
              <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
              <?php if ($error_password) { ?>
              <div class="text-danger"><?php echo $error_password; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
            <div class="col-sm-10">
              <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
              <?php if ($error_confirm) { ?>
              <div class="text-danger"><?php echo $error_confirm; ?></div>
              <?php } ?>
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