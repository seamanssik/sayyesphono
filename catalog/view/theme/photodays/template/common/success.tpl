<?php echo $header; ?>
  <div class="heading-background" style="height: 130px!important; margin-bottom: 0px!important;">
    <div class="container">
      <div class="h1"><?php echo $heading_title; ?></div>
      <ul class="breadcrumb h1-after">
        <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
          <?php if($i+1<count($breadcrumbs)) { ?><li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><l/i> <?php } else { ?><li class="active"><span><?php echo $breadcrumb['text']; ?></span></li><?php } ?>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="heading-container container">
    <div class="text-message">
      <?php echo $text_message; ?>
    </div>
    <div class="buttons">
      <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn__primary"><span><?php echo $button_continue; ?></span></a></div>
    </div>
  </div>
<?php echo $footer; ?>