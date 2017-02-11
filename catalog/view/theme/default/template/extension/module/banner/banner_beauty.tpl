<div class="beauty">
    <div class="container">
        <div class="row">
            <div class="beauty-col col-ed-5">
                <div class="beauty-title beauty-title__first large" data--100-bottom="transform: translate3d(0,0%,0)" data--100-top="transform: translate3d(0,80%,0)"><?php echo $banners[0]['field_1']; ?></div>
                <div class="beauty-figure">
                    <img src="<?php echo $banners[0]['thumb']; ?>" alt="<?php echo strip_tags($banners[0]['field_1']); ?>" class="img-responsive">
                </div>
                <div class="beauty-description">
                    <?php echo $banners[0]['title']; ?>
                </div>
                <div class="beauty-link">
                    <a href="<?php echo $banners[0]['link']; ?>"><span>Выбрать фотосессию</span></a>
                </div>
            </div>
            <div class="beauty-col col-ed-4">
                <div class="beauty-figure__caption"
                     data-600-top="transform: translate3d(0,-2%,0)"
                     data--100-top="transform: translate3d(0,8%,0)">
                    <span>— <?php echo $banners[1]['field_1']; ?></span>
                    <img src="<?php echo $banners[1]['thumb']; ?>" alt="<?php echo strip_tags($banners[1]['field_1']); ?>" width="361" height="562" class="img-responsive">
                </div>
            </div>
            <div class="beauty-col col-ed-3">
                <div class="beauty-title beauty-title__second"
                     data--100-bottom="transform: translate3d(0,0%,0)"
                     data--100-top="transform: translate3d(0,-70%,0)"><?php echo $banners[2]['field_1']; ?></div>
                <div class="beauty-figure">
                    <img src="<?php echo $banners[2]['thumb']; ?>" alt="<?php echo strip_tags($banners[2]['field_1']); ?>" class="img-responsive">
                </div>
                <div class="beauty-description">
                    <?php echo $banners[2]['title']; ?>
                </div>
                <div class="beauty-link">
                    <a href="<?php echo $banners[2]['link']; ?>"><span>Подобрать платье</span></a>
                </div>
            </div>
        </div>
    </div>
</div>