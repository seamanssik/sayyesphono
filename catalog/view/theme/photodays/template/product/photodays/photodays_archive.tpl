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
    <?php if ($photodays_products) { ?>
        <?php foreach ($photodays_products as $photodays_product) { ?>
            <div class="photodaysItem">
                <div class="photodaysItem-overlay">
                    <div class="photodaysItem-figure">
                        <div class="photodaysItem-date hidden js-animate">
                            <div class="photodaysItem-date__item">
                                <span class="city"><b><?php echo $photodays_product['city']; ?></b></span>
                                <span class="date"><?php echo $photodays_product['date']; ?></span>
                                <span class="year"><?php echo $photodays_product['year']; ?></span>
                            </div>
                        </div>
                        <div class="photodaysItem-image js-animate -show-from-top o-animate-img -animate-gold c-parallax cd-inline">
                            <div class="photodaysItem-image__label hidden"><img src="/image/catalog/labels/label-finish.png" /></div>
                            <div class="c-wrap-img-anim">
                                <a href="<?php echo $photodays_product['href']; ?>"><img class="photodaysItem-image__img" src="<?php echo $photodays_product['thumb']; ?>" alt="<?php echo $photodays_product['name']; ?>" /></a>
                            </div>
                        </div>
                    </div>
                    <div class="photodaysItem-description">
                        <div class="photodaysItem-description__logo" data-top="transform: translate3d(0,-20%,0)" data-bottom="transform: translate3d(0,7%,0)">
                            <img src="<?php echo $photodays_product['logo']; ?>" alt="<?php echo $photodays_product['name']; ?>">
                        </div>
                        <div class="photodaysItem-description__title visible-xs"><?php echo $photodays_product['name']; ?></div>
                        <div class="photodaysItem-description__description">
                            <?php echo $photodays_product['description']; ?>
                        </div>
                        <a href="<?php echo $photodays_product['href']; ?>" class="photodaysItem-description__link"><span>Подробнее</span></a>
                    </div>
                </div>
            </div>
        <?php } ?>
        <div class="photodays-pagination">
            <?php echo $pagination; ?>
        </div>
    <?php } ?>
</div>
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
