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
  <div class="about-welcome">
    <div class="about-welcome__container">
      <div class="about-welcome__figure">
        <figure><img src="<?php echo 'image/' . $custom_field['about_image_1']; ?>" alt="Сергей Евсюков"></figure>
      </div>
      <div class="about-welcome__info">
        <?php echo $description; ?>
        <div class="bg" data--300-bottom="transform: translate3d(0,-3%,0)" data-100-bottom="transform: translate3d(0,4%,0)"></div>
      </div>
    </div>
  </div>
  <?php echo $content_top; ?>
  <div class="aboutZest">
    <div class="aboutZest-container">
      <div class="col-lg-6 col-md-12">
        <div class="aboutZest-info">
          <div class="aboutZest-info__title" data-100-top="transform: translate3d(0,-15%,0)" data-bottom="transform: translate3d(0,50%,0)">
            <div class="js-animate"><div class="c-text-masked"><span><?php echo $custom_field['text_1']; ?></span></div></div>
          </div>
          <div class="aboutZest-info__description js-animate">
            <div class="c-text-masked">
              <?php echo html_entity_decode($custom_field['description_1'], ENT_QUOTES, 'UTF-8'); ?>
            </div>
          </div>
        </div>
        <div class="aboutZest-thumb hidden-md hidden-sm">
          <div class="aboutZest-thumb__logo"></div>
          <div class="aboutZest-thumb__figure" data-100-top="transform: translate3d(0,-25%,0)" data-400-bottom="transform: translate3d(0,10%,0)">
            <span>— SAY YES PHOTODAYS</span>
            <div class="js-animate -show-from-right c-parallax is-black-n-white o-animate-img -animate-beige cd-inline">
              <div class="c-wrap-img-anim">
                <img src="<?php echo 'image/' . $custom_field['image_1']; ?>" alt="SAY YES PHOTODAYS" width="279" height="472" class="img-responsive">
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-6 col-md-12">
        <div class="aboutZest-main">
          <div class="aboutZest-main__figure hidden-md hidden-sm" data-200-top="transform: translate3d(0,-15%,0)" data--450-bottom="transform: translate3d(0,10%,0)">
            <div class="js-animate -show-from-top o-animate-img -animate-gold c-parallax cd-inline">
              <div class="c-wrap-img-anim">
                <img src="<?php echo 'image/' . $custom_field['image_2']; ?>" alt="<?php echo $custom_field['text_1']; ?>" width="692" height="694" class="img-responsive">
              </div>
            </div>
          </div>
          <div class="aboutZest-main__description js-animate">
            <div class="c-text-masked">
              <?php echo html_entity_decode($custom_field['description_2'], ENT_QUOTES, 'UTF-8'); ?>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="about-welcome before-welcome">
    <div class="about-welcome__container">
      <div class="about-welcome__title js-animate">
        <div class="c-text-masked" style="color: #bd9d53;">
          <span>Ты достойна<br> самого лучшего!</span>
<!--          <span>--><?php //echo html_entity_decode($custom_field['welcome_text_1'], ENT_QUOTES, 'UTF-8'); ?><!--</span>-->
        </div>
      </div>
      <div class="about-welcome__figure">
        <figure data-200-bottom="transform: translate3d(0,-5%,0)"
                data-bottom="transform: translate3d(0,0%,0)"
                data-top="transform: translate3d(0,0%,0)"
                data--200-top="transform: translate3d(0,5%,0)">
          <div class="js-animate -show-from-top o-animate-img -animate-gold c-parallax cd-inline">
            <div class="c-wrap-img-anim">
              <img src="<?php echo 'image/' . $custom_field['welcome_image_1']; ?>" alt="<?php echo strip_tags(html_entity_decode($custom_field['welcome_text_1'], ENT_QUOTES, 'UTF-8')); ?>">
            </div>
          </div>
        </figure>
      </div>
      <div class="about-welcome__info">
        <span class="logo">Photodays</span>
        <div class="js-animate">
          <div class="c-text-masked">
            <?php echo html_entity_decode($custom_field['welcome_description_1'], ENT_QUOTES, 'UTF-8'); ?>
          </div>
        </div>
        <dib class="bg"></dib>
      </div>
    </div>
  </div>
  <?php echo $content_bottom; ?>
<?php echo $footer; ?>