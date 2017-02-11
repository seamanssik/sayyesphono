<?php echo $header; ?>
  <main>
    <?php echo $content_top; ?>
    <div class="legend">
      <div class="container">
        <div class="col-lg-5 col-md-5 col-sm-5">
          <div class="legend-figure">
          <span data-100-bottom="transform: translate3d(0,-6%,0)" data--500-bottom="transform: translate3d(0,0,0)"></span>
            <div class="js-animate -show-from-right c-parallax is-black-n-white o-animate-img -animate-beige cd-inline">
              <div class="c-wrap-img-anim">
                <img src="<?php echo $legend_fields['image_1']; ?>" alt="<?php echo $legend_fields['field_3']; ?>" width="521" height="756" class="img-responsive">
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-7 col-md-7 col-sm-7">
          <div class="legend-overlay">
            <div class="legend-overlay__scroll" data-200-bottom="transform: translate3d(0,0%,0)" data--700-bottom="transform: translate3d(0,8%,0)">
              <div class="legend-title js-animate"><div class="c-text-masked"><span><?php echo $legend_fields['field_1']; ?></span></div></div>
              <div class="legend-quote js-animate"><div class="c-text-masked"><span><?php echo $legend_fields['field_2']; ?></span></div></div>
              <div class="legend-slave js-animate"><div class="c-text-masked"><span><?php echo $legend_fields['field_3']; ?></span></div></div>
              <div class="legend-description js-animate">
                <div class="c-text-masked">
                  <?php echo $legend_fields['field_4']; ?>
                </div>
              </div>
              <div class="legend-link js-animate">
                <div class="c-text-masked">
                  <p><a href="<?php echo $legend_fields['field_5']; ?>"><span>Подробнее</span></a></p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <?php echo $content_bottom; ?>
  </main>
<?php echo $footer; ?>