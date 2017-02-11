<?php echo $header; ?>
  <div class="heading-background">
    <div class="container">
      <div class="h1 js-animate"><div class="c-text-masked"><span><?php echo $heading_title; ?></span></div></div>
      <ul class="breadcrumb h1-after">
        <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
          <?php if($i+1<count($breadcrumbs)) { ?><li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><l/i> <?php } else { ?><li class="active"><span><?php echo $breadcrumb['text']; ?></span></li><?php } ?>
        <?php } ?>
      </ul>
    </div>
  </div>
  <?php echo $content_top; ?>
  <div class="container franchise">
    <div class="row franchise-row">
      <div class="col-lg-5 col-lg-offset-1 col-md-7 col-sm-12">
        <div class="franchise-info">
          <div class="franchise-title js-animate">
            <div class="lines o-lines-animate js-animate">
              <i></i>
              <i></i>
              <i></i>
              <i></i>
            </div>
            <div class="c-text-masked"><span><?php echo $custom_field['field_1']; ?></span></div>
          </div>
          <div class="franchise-description">
            <?php echo $description; ?>
          </div>
          <div class="franchise-list">
            <?php echo html_entity_decode($custom_field['field_2'], ENT_QUOTES, 'UTF-8'); ?>
          </div>
        </div>
      </div>
      <div class="col-lg-5 col-lg-offset-1 col-md-5 hidden-sm hidden-sx">
        <div class="franchise-figure__one">
          <div class="franchise-figure__big js-animate -show-from-top o-animate-img -animate-gold c-parallax cd-inline">
            <div class="c-wrap-img-anim">
              <img src="image/<?php echo $custom_field['figure_big_1']; ?>" alt="">
            </div>
          </div>
          <div class="franchise-figure__small js-animate -show-from-right c-parallax is-black-n-white o-animate-img -animate-beige cd-inline">
            <div class="c-wrap-img-anim">
              <img src="image/<?php echo $custom_field['figure_small_1']; ?>" alt="">
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <?php echo $content_bottom; ?>
  <div class="container">
    <div class="row franchise-row--2">
      <div class="col-lg-5 col-lg-offset-1 col-md-6 hidden-sm hidden-sx">
        <div class="franchise-figure__second">
          <div class="franchise-figure__big js-animate -show-from-top o-animate-img -animate-gold c-parallax cd-inline">
            <div class="c-wrap-img-anim">
              <img src="image/<?php echo $custom_field['figure_big_2']; ?>" alt="">
            </div>
          </div>
          <div class="franchise-figure__small js-animate -show-from-right c-parallax is-black-n-white o-animate-img -animate-beige cd-inline">
            <div class="c-wrap-img-anim">
              <img src="image/<?php echo $custom_field['figure_small_2']; ?>" alt="">
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-5 col-lg-offset-1 col-md-6 col-sm-12">
        <div class="franchise-request">
          <div class="franchise-description franchise-request__description">
            <?php echo html_entity_decode($custom_field['field_3'], ENT_QUOTES, 'UTF-8'); ?>
          </div>
          <div class="js-animate">
            <div class="c-text-masked">
              <span>
                <a href="#" data-toggle="modal" data-target="#modalRequest" class="franchise-link"><span>Заявка на сотрудничество</span></a>
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="faq-form">
    <div class="container faq-form__container">
      <form id="form-faq" method="post" enctype="multipart/form-data" class="form-horizontal" autocomplete="off">
        <fieldset>
          <legend class="js-animate"><div class="c-text-masked"><span>Остались вопросы?</span></div></legend>
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group js-animate">
                <label class="col-sm-12 control-label" for="input-name">Имя:</label>
                <div class="col-sm-12">
                  <input type="text" name="author_name" id="input-name" value="<?php // echo $author_name; ?>" class="form-control" />
                </div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group js-animate">
                <label class="col-sm-12 control-label" for="input-email">Email:</label>
                <div class="col-sm-12">
                  <input type="text" name="author_mail" id="input-email" value="<?php // echo $author_mail; ?>" class="form-control" />
                </div>
              </div>
            </div>
          </div>
          <div class="form-group js-animate">
            <label class="col-sm-12 control-label" for="input-title">Вопрос:</label>
            <div class="col-sm-12">
              <textarea rows="1" name="title" id="input-title" class="form-control"><?php // echo $title;?></textarea>
            </div>
          </div>
        </fieldset>
        <div class="buttons text-center">
          <input type="hidden" name="key" value="testimonial">
          <button type="submit" class="js-animate"><span>Отправить</span></button>
        </div>
      </form>
    </div>
  </div>
<?php echo $footer; ?>