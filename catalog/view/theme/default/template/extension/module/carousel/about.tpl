<div class="about-carousels">
    <div class="about-carousels__container">
        <div id="aboutCarousel">
            <?php foreach ($banners as $banner) { ?>
            <div class="about-carousel">
                <div class="about-carousel__figure">
                    <figure><img src="<?php echo $banner['image']; ?>" alt="<?php echo strip_tags($banner['field_1']); ?>"></figure>
                </div>
                <div class="about-carousel__info">
                    <div class="description">
                        <?php echo $banner['title']; ?>
                    </div>
                    <div class="people"><?php echo $banner['field_1']; ?></div>
                    <div class="position"><?php echo $banner['field_2']; ?></div>
                    <div class="about-carousel__control">&nbsp;</div>
                </div>
            </div>
            <?php } ?>
        </div>
        <div class="about-carousels__controls"></div>
    </div>
</div>