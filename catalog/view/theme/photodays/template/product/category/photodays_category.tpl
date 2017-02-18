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
    <div class="container">
        <?php if ($photodays_categories) { ?>
        <div class="photodays-category">
            <ul class="photodays-categories">
                <li class="photodays-categories__item"><a href="<?php echo $photodays_link; ?>" class="categories-item__link<?php echo $photodays_active; ?>"><span>Все</span></a></li>
                <?php foreach ($photodays_categories as $photodays_category) { ?>
                    <li class="photodays-categories__item"><a href="<?php echo $photodays_category['href']; ?>" class="categories-item__link<?php echo $photodays_category['active']; ?>"><span><?php echo $photodays_category['name']; ?></span></a></li>
                <?php } ?>
            </ul>
        </div>
        <?php } ?>
        <?php if ($products) { ?>
            <div class="row photodaysItems">
                <?php foreach ($products as $product) { ?>
                    <div class="col-lg-6 col-md-6 photodaysItems-col">
                        <div class="photodaysItem photodaysItems-item">
                            <div class="photodaysItem-overlay photodaysItems-overlay">
                                <div class="photodaysItem-figure photodaysItems-figure">
                                    <div class="photodaysItem-date js-animate">
                                        <div class="photodaysItem-date__item photodaysItems-date__item">
                                            <span class="city"><b><?php echo $product['city']; ?></b></span>
                                            <span class="date"><?php echo $product['date']; ?></span>
                                            <span class="year"><?php echo $product['year']; ?></span>
                                        </div>
                                    </div>
                                    <div class="photodaysItem-image js-animate -show-from-top o-animate-img -animate-gold c-parallax cd-inline">
                                        <div class="photodaysItem-image__label hidden"><img src="/image/catalog/labels/label-finish.png" /></div>
                                        <div class="c-wrap-img-anim">
                                            <a href="<?php echo $product['href']; ?>"><img class="photodaysItem-image__img" src="<?php echo $product['thumb_photodays']; ?>" alt="<?php echo $product['name']; ?>" /></a>
                                            <button type="button" data-toggle="tooltip" class="btn btn-default wishlist_item <?php echo $product['wishlist_cative']; ?>" title=""
                                                <?php if($logged == true) {?>
                                                    onclick="wishlist.add(<?php echo $product['product_id']; ?>);$(this).addClass('active');"
                                                <?php }else{ ?>
                                                    onclick="window.location.href = 'account/login'"
                                                <?php };?>
                                                    data-original-title="Add to Wish List">
                                            </button>
                                        </div>
                                        <div class="product-thumb__mask">
                                            <div class="product-thumb__info">
                                                <div class="product-thumb__rent"><?php echo $product['price']; ?></div>
                                                <div class="product-thumb__currency"><span style="text-transform: uppercase"><?php echo $product['symbol']; ?></span></div>
                                                <?php if ($product['price_buy']) { ?><div class="product-thumb__price"><?php echo $product['price_buy']; ?><span>выкуп</span></div><?php } ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="photodaysItem-description photodaysItems-description">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <div class="photodaysItem-description__logo photodaysItems-description__logo" data-top="transform: translate3d(0,-20%,0)" data-bottom="transform: translate3d(0,7%,0)">
                                                <img src="<?php echo $product['logo']; ?>" alt="<?php echo $product['name']; ?>">
                                            </div>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 photodaysItems-description__col">
                                            <div class="photodaysItem-description__title visible-xs"><?php echo $product['name']; ?></div>
                                            <div class="photodaysItem-description__description photodaysItems-description__description">
                                                <?php echo $product['description']; ?>
                                            </div>
                                            <a href="<?php echo $product['href']; ?>" class="photodaysItem-description__link"><span>Подробнее</span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>
            <div class="photodaysItems-pagination">
                <?php echo $pagination; ?>
            </div>
        <?php } ?>
    </div>
<?php if ($archiveImages) { ?>
<div class="archivePhoto hidden-sm hidden-xs">
    <div class="container">
        <div class="archivePhoto-title js-animate"><div class="c-text-masked"><span>Архив <br>фотосессий</span></div></div>
        <div class="archivePhoto-items">
            <?php $i = 1; foreach ($archiveImages as $archiveImage) { ?>
                <?php if ($i != 3 && $i != 5 && $i != 7) { ?>
                <?php if ($i == 6) { ?><div class="archivePhoto-item item-7"><?php } ?>
                <div class="archivePhoto-item item-<?php echo $i; ?>">
                    <?php if ($i == 2) { ?>
                        <a href="<?php echo $archiveImage['href']; ?>"><img src="<?php echo $archiveImage['thumb']; ?>" alt="<?php echo $archiveImage['name']; ?>" width="<?php echo $archiveImage['width']; ?>" height="<?php echo $archiveImage['height']; ?>"></a>
                        <?php if (!empty($archiveImages[2])) { ?><a href="<?php echo $archiveImages[2]['href']; ?>"><img src="<?php echo $archiveImages[2]['thumb']; ?>" alt="<?php echo $archiveImages[2]['name']; ?>" width="<?php echo $archiveImages[2]['width']; ?>" height="<?php echo $archiveImages[2]['height']; ?>"></a><?php } ?>
                    <?php } elseif ($i == 4) { ?>
                        <a href="<?php echo $archiveImage['href']; ?>"><img src="<?php echo $archiveImage['thumb']; ?>" alt="<?php echo $archiveImage['name']; ?>" width="<?php echo $archiveImage['width']; ?>" height="<?php echo $archiveImage['height']; ?>"></a>
                        <?php if (!empty($archiveImages[4])) { ?><a href="<?php echo $archiveImages[4]['href']; ?>"><img src="<?php echo $archiveImages[4]['thumb']; ?>" alt="<?php echo $archiveImages[4]['name']; ?>" width="<?php echo $archiveImages[4]['width']; ?>" height="<?php echo $archiveImages[4]['height']; ?>"></a><?php } ?>
                    <?php } elseif ($i == 6) { ?>
                        <a href="<?php echo $archiveImage['href']; ?>"><img src="<?php echo $archiveImage['thumb']; ?>" alt="<?php echo $archiveImage['name']; ?>" width="<?php echo $archiveImage['width']; ?>" height="<?php echo $archiveImage['height']; ?>"></a>
                        <?php if (!empty($archiveImages[6])) { ?><a href="<?php echo $archiveImages[6]['href']; ?>"><img src="<?php echo $archiveImages[6]['thumb']; ?>" alt="<?php echo $archiveImages[6]['name']; ?>" width="<?php echo $archiveImages[6]['width']; ?>" height="<?php echo $archiveImages[6]['height']; ?>"></a><?php } ?>
                    <?php } elseif ($i == 8) { ?>
                        <a href="<?php echo $archiveImage['href']; ?>"><img src="<?php echo $archiveImage['thumb']; ?>" alt="<?php echo $archiveImage['name']; ?>" width="<?php echo $archiveImage['width']; ?>" height="<?php echo $archiveImage['height']; ?>"></a>
                        <?php if (!empty($archiveImages[8])) { ?><a href="<?php echo $archiveImages[8]['href']; ?>"><img src="<?php echo $archiveImages[8]['thumb']; ?>" alt="<?php echo $archiveImages[8]['name']; ?>" width="<?php echo $archiveImages[8]['width']; ?>" height="<?php echo $archiveImages[8]['height']; ?>"></a><?php } ?>
                    <?php } else { ?>
                        <a href="<?php echo $archiveImage['href']; ?>"><img src="<?php echo $archiveImage['thumb']; ?>" alt="<?php echo $archiveImage['name']; ?>" width="<?php echo $archiveImage['width']; ?>" height="<?php echo $archiveImage['height']; ?>"></a>
                    <?php } ?>
                </div>
                <?php if ($i == 8) { ?></div><?php } ?>
                <?php } ?>
            <?php $i++; } ?>
        </div>
    </div>
</div>
<?php } ?>
<?php echo $content_bottom; ?>
<?php if ($description) { ?>
    <div class="welcome">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 hidden-sm hidden-xs js-animate">
                    <img class="welcome-logo" src="/image/theme/logo-welcome.png" data-rjs="/image/theme/2x/logo-welcome.png" alt="Новый день, новый образ - новая ты!" title="Sey Yes! Photodays" width="491" height="188">
                    <div class="clearfix"></div>
                    <p class="welcome-alt c-text-masked"><span>Новый день, новый образ - новая ты!</span></p>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="welcome-text">
                        <?php if($heading_title) { ?>
                            <div class="welcome-text__title js-animate"><div class="c-text-masked"><span><?php echo $heading_title; ?></span></div></div>
                        <?php } ?>
                        <div class="welcome-text__description">
                            <div class="jcf-scrollable">
                                <?php echo $description; ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php } ?>
<?php echo $footer; ?>