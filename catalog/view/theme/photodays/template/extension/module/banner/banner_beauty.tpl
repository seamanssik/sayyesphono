<div class="beauty">
    <div class="container">
        <div class="row">
            <div class="beauty-col col-ed-5 col-lg-5 col-md-5 col-sm-5">
                <div class="js-animate beauty-title beauty-title__first large" data--100-bottom="transform: translate3d(0,0%,0)" data--100-top="transform: translate3d(0,80%,0)">
                    <div class="c-text-masked">
                        <p><?php echo $banners[0]['field_1']; ?></p>
                    </div>
                </div>
                <div class="beauty-figure js-animate -show-from-top o-animate-img -animate-gold c-parallax cd-inline">
                    <div class="c-wrap-img-anim">
                        <a href="<?php echo $banners[0]['link']; ?>"><img src="<?php echo $banners[0]['thumb']; ?>" alt="<?php echo strip_tags($banners[0]['field_1']); ?>" class="img-responsive"></a>
                    </div>
                </div>
                <div class="beauty-description js-animate">
                    <div class="c-text-masked">
                        <p><?php echo $banners[0]['title']; ?></p>
                    </div>
                </div>
                <div class="beauty-link js-animate">
                    <div class="c-text-masked">
                        <p><a href="<?php echo $banners[0]['link']; ?>"><span>Выбрать фотосессию</span></a></p>
                    </div>
                </div>
            </div>
            <div class="beauty-col col-ed-4 col-lg-4 col-md-4 hidden-sm hidden-xs">
                <div class="beauty-figure__caption" data-600-top="transform: translate3d(0,-2%,0)" data--100-top="transform: translate3d(0,8%,0)">
                    <span>— <?php echo $banners[1]['field_1']; ?></span>
                    <div class="js-animate -show-from-right c-parallax is-black-n-white o-animate-img -animate-beige cd-inline">
                        <div class="c-wrap-img-anim">
                            <a href="<?php echo $banners[1]['link']; ?>"><img src="<?php echo $banners[1]['thumb']; ?>" alt="<?php echo strip_tags($banners[1]['field_1']); ?>" width="361" height="562" class="img-responsive"></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="beauty-col col-ed-3 col-lg-3 col-md-3 col-md-offset-0 col-sm-5 col-sm-offset-2">
                <div class="js-animate beauty-title beauty-title__second" data--100-bottom="transform: translate3d(0,0%,0)" data--100-top="transform: translate3d(0,-70%,0)">
                    <div class="c-text-masked"><p><?php echo $banners[2]['field_1']; ?></p></div>
                </div>
                <div class="beauty-figure">
                    <div class="js-animate -show-from-top o-animate-img -animate-gold c-parallax cd-inline">
                        <div class="c-wrap-img-anim">
                            <a href="<?php echo $banners[2]['link']; ?>"><img src="<?php echo $banners[2]['thumb']; ?>" alt="<?php echo strip_tags($banners[2]['field_1']); ?>" class="img-responsive"></a>
                        </div>
                    </div>
                </div>
                <div class="beauty-description js-animate">
                    <div class="c-text-masked">
                        <?php echo $banners[2]['title']; ?>
                    </div>
                </div>
                <div class="beauty-link js-animate">
                    <div class="c-text-masked">
                        <p><a href="<?php echo $banners[2]['link']; ?>"><span>Выбрать платье</span></a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>