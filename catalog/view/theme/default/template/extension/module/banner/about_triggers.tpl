<div class="about-triggers">
    <div class="about-triggers__container">
        <?php foreach ($banners as $banner) { ?>
        <div class="about-trigger">
            <div class="about-trigger__figure">
                <div class="background"></div>
                <div class="lines o-lines-animate js-animate"><i></i><i></i><i></i><i></i></div>
                <div class="js-animate -show-from-top o-animate-img -animate-gold c-parallax cd-inline" data--100-top="transform: translate3d(0,30px,0)" data-300-top="transform: translate3d(0,-30px,0)">
                    <div class="c-wrap-img-anim">
                        <img src="<?php echo $banner['image']; ?>" alt="<?php echo strip_tags($banner['title']); ?>">
                    </div>
                </div>
            </div>
            <div class="about-trigger__title js-animate">
                <div class="c-text-masked">
                    <span><?php echo strip_tags($banner['title']); ?></span>
                </div>
            </div>
        </div>
        <?php } ?>
    </div>
</div>