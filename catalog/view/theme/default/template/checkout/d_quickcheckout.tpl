<?php echo $header; ?>
  <div class="heading-background transparent no_margin">
    <div class="container">
      <div class="h1 js-animate"><div class="c-text-masked"><span><?php echo $heading_title; ?></span></div></div>
      <ul class="breadcrumb h1-after">
        <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
          <?php if($i+1<count($breadcrumbs)) { ?><li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><l/i> <?php } else { ?><li class="active"><span><?php echo $breadcrumb['text']; ?></span></li><?php } ?>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container" id="container">
    <?php if ($error_warning) { ?>
      <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
    <?php } ?>
    <div class="row"><?php echo $column_left; ?>
      <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
      <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
      <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
      <?php } ?>
      <div id="content" class="<?php echo $class; ?>">
        <?php echo $content_top; ?>
        <?php echo $d_quickcheckout; ?>
        <?php echo $content_bottom; ?>
      </div>
      <?php echo $column_right; ?>
    </div>
  </div>
<?php echo $footer; ?>