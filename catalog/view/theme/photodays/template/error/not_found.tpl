<?php echo $header; ?>
<div class="container">
  <div class="not_found">
    <div class="row">
      <div class="col-ed-7">
        <img src="/image/theme/404.png" class="img-responsive" alt="<?php echo $heading_title; ?>">
      </div>
      <div class="col-ed-5">
        <div class="not_found-text">
          <p><?php echo $text_error; ?></p>
          <a href="<?php echo $continue; ?>"><span><?php echo $button_continue; ?></span></a>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
  $('body').addClass('error-not_found');
</script>
<?php echo $footer; ?>
