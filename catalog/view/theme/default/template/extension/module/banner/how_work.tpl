<div class="how">
    <div class="container">
        <div class="col-lg-6">
            <div class="how-info">
                <div class="how-info__title" data-100-top="transform: translate3d(0,0%,0)" data-bottom="transform: translate3d(0,15%,0)"><?php echo $banners[0]['field_1']; ?></div>
                <div class="how-info__description" data-100-top="transform: translate3d(0,0%,0)" data-bottom="transform: translate3d(0,15%,0)">
                    <?php echo $banners[0]['title']; ?>
                </div>
            </div>
            <div class="how-thumb">
                <div class="how-thumb__logo"></div>
                <div class="how-thumb__figure" data-100-top="transform: translate3d(0,-10%,0)" data-400-bottom="transform: translate3d(0,10%,0)">
                    <span>— <?php echo $banners[1]['field_1']; ?></span>
                    <img src="<?php echo strip_tags($banners[1]['thumb']); ?>" alt="<?php echo strip_tags($banners[1]['field_1']); ?>" width="279" height="472" class="img-responsive">
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="how-main">
                <div class="how-main__figure" data-100-top="transform: translate3d(0,-5%,0)" data--600-bottom="transform: translate3d(0,10%,0)">
                    <img src="<?php echo $banners[0]['thumb']; ?>" alt="<?php echo strip_tags($banners[0]['field_1']); ?>" width="692" height="694" class="img-responsive">
                </div>
                <div class="how-main__description" data-300-bottom="transform: translate3d(0,18%,0)" data--600-bottom="transform: translate3d(0,25%,0)">
                    <?php echo $banners[1]['title']; ?>
                </div>
            </div>
        </div>
    </div>
</div>