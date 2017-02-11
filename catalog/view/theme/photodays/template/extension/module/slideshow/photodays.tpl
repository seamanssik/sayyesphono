<div class="photodays hidden-sm hidden-xs">
    <div class="container">
        <div class="photodays-title js-animate">
            <div class="c-text-masked"><span>—Photodays</span></div>
        </div>
        <div class="photodays-controls"></div>
    </div>
    <div class="photodays-items" id="photodaysSlideShow">
        <?php foreach ($banners as $banner) { ?>
        <div class="photodays-item">
            <div class="photodays-item__thumb" style="background-image: url('<?php echo $banner['image']; ?>');">
                <img src="<?php echo $banner['image']; ?>">
            </div>
            <div class="photodays-item__container">
                <div class="container">
                    <div class="row photodays-item__row">
                        <div class="col-ed-5 col-lg-6 col-md-6 photodays-item__col">
                            <div class="photodays-item__description">
                                <?php echo $banner['title']; ?>
                            </div>
                            <div class="photodays-item__title">
                                <img src="image/<?php echo $banner['field_3']; ?>">
                            </div>
                            <div class="photodays-item__info">
                                <div class="photodays-item__info--item">
                                    <div class="day"><?php echo $banner['field_1']; ?></div>
                                    <div class="separator">&nbsp;</div>
                                    <div class="city"><?php echo $banner['field_2']; ?></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php } ?>
    </div>
</div>