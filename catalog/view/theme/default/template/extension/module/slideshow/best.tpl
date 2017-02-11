<div class="best">
    <div class="container">
        <div class="best-title" data-top="transform: translate3d(0,10%,0)" data-600-top="transform: translate3d(0,-25%,0)">—Лучшая модель</div>
    </div>
    <div id="bestSlideShow">
        <?php foreach ($banners as $banner) { ?>
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="best-description">
                        <div data-100-bottom="transform: translate3d(0,-25%,0)" data-100-top="transform: translate3d(0,0,0)">
                            <span>модель —</span>
                            <p><?php echo $banner['title']; ?></p>
                            <hr>
                            <span>фотосессия —</span>
                            <p><?php echo $banner['field_1']; ?></p>
                        </div>
                    </div>
                    <div class="best-link" data-100-bottom="transform: translate3d(0,100%,0)" data--300-bottom="transform: translate3d(0,25%,0)" data-300-top="transform: translate3d(0,25%,0)" data--100-top="transform: translate3d(0,75%,0)">
                        <a href="<?php echo $banner['link']; ?>"><span><?php echo $banner['field_2']; ?></span></a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="best-image">
                        <span></span>
                        <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" width="1130" height="776" data-300-bottom="transform: translate3d(0,-10%,0)" data-bottom="transform: translate3d(0,0%,0)" data-top="transform: translate3d(0,0%,0)" data--300-top="transform: translate3d(0,10%,0)">
                        <div class="best-image__controls"></div>
                    </div>
                </div>
            </div>
        </div>
        <?php } ?>
    </div>
    <div class="best-controls"></div>
</div>