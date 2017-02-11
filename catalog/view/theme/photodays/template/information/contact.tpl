<?php echo $header; ?>
<div class="container">
  <div class="contact-row row">
    <div class="contact-col col-ed-6 col-lg-5">
      <div class="contact-heading">
        <div class="h1 js-animate"><div class="c-text-masked"><span><?php echo $heading_title; ?></span></div></div>
        <ul class="breadcrumb contact-breadcrumb h1-after">
          <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
            <?php if($i+1<count($breadcrumbs)) { ?><li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><l/i> <?php } else { ?><li class="active"><span><?php echo $breadcrumb['text']; ?></span></li><?php } ?>
          <?php } ?>
        </ul>
      </div>
      <div class="contacts">
        <div class="contact-item">
          <div class="contact-item__title js-animate"><div class="c-text-masked"><span>— <?php echo $text_telephone; ?>:</span></div></div>
          <ul class="contact-item__list">
            <li><?php echo $telephone; ?></li>
            <li><?php echo $telephone_2; ?></li>
          </ul>
        </div>
        <div class="contact-item">
          <div class="contact-item__title js-animate"><div class="c-text-masked"><span>— email:</span></div></div>
          <a href="#" class="contact-item__link"><?php echo $c_email; ?></a>
        </div>
        <div class="contact-item">
          <div class="contact-item__title js-animate"><div class="c-text-masked"><span>— <?php echo $text_address; ?>:</span></div></div>
          <address class="contact-item__address"><?php echo $address; ?></address>
        </div>
        <div class="contact-item">
          <div class="contact-item__title js-animate"><div class="c-text-masked"><span>— <?php echo $text_social; ?>:</span></div></div>
          <ul class="contact-item__social">
            <?php if ($link_in) { ?><li><span><a href="<?php echo $link_in; ?>" target="_blank" class="contact-social__item contact-social__int">Photodays в Instagram</a></span></li><?php } ?>
            <?php if ($link_vk) { ?><li><span><a href="<?php echo $link_vk; ?>" target="_blank" class="contact-social__item contact-social__vk">Photodays Вконтакте</a></span></li><?php } ?>
            <?php if ($link_fb) { ?><li><span><a href="<?php echo $link_fb; ?>" target="_blank" class="contact-social__item contact-social__fb">Photodays в Facebook</a></span></li><?php } ?>
            <?php if ($link_you) { ?><li><span><a href="<?php echo $link_you; ?>" target="_blank" class="contact-social__item contact-social__you">Смотрите Photodays на youtube</a></span></li><?php } ?>
          </ul>
        </div>
      </div>
    </div>
    <div class="contact-col col-ed-6 col-lg-7">
      <div class="contact-map" id="contactMap"></div>
    </div>
  </div>
</div>
<div class="contact-form">
  <div class="container contact-form__container">
    <form action="<?php echo $action; ?>" method="post" id="form-contact" enctype="multipart/form-data" class="form-horizontal" autocomplete="off">
      <fieldset>
        <legend class="js-animate"><div class="c-text-masked"><span><?php echo $text_contact; ?></span></div></legend>
        <div class="row">
          <div class="col-sm-6">
            <div class="form-group js-animate">
              <label class="col-sm-12 control-label" for="input-name"><?php echo $entry_name; ?>:</label>
              <div class="col-sm-12">
                <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
                <?php if ($error_name) { ?>
                  <div class="text-danger"><?php echo $error_name; ?></div>
                <?php } ?>
              </div>
            </div>
          </div>
          <div class="col-sm-6">
            <div class="form-group js-animate">
              <label class="col-sm-12 control-label" for="input-email"><?php echo $entry_email; ?>:</label>
              <div class="col-sm-12">
                <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
                <?php if ($error_email) { ?>
                  <div class="text-danger"><?php echo $error_email; ?></div>
                <?php } ?>
              </div>
            </div>
          </div>
        </div>
        <div class="form-group js-animate">
          <label class="col-sm-12 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?>:</label>
          <div class="col-sm-12">
            <textarea name="enquiry" rows="2" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
            <?php if ($error_enquiry) { ?>
              <div class="text-danger"><?php echo $error_enquiry; ?></div>
            <?php } ?>
          </div>
        </div>
        <?php echo $captcha; ?>
      </fieldset>
      <div class="buttons text-center">
        <button type="submit" class="js-animate"><span><?php echo $button_submit; ?></span></button>
      </div>
    </form>
  </div>
</div>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAe0e7RzQTppvzTEUNRuNq5PqhpSOpF7yA"></script>
<?php echo $footer; ?>
