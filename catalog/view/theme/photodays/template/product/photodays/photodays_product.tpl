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
    <div class="photodaysItem photodays">
        <div class="photodaysItem-overlay photodays-overlay">
            <div class="photodaysItem-figure">
                <div class="photodaysItem-date js-animate">
                    <div class="photodaysItem-date__item">
                        <span class="city"><b><?php echo $city; ?></b></span>
                        <span class="date"><?php echo $date; ?></span>
                        <span class="year"><?php echo $year; ?></span>
                    </div>
                </div>
                <div class="photodaysItem-image js-animate -show-from-top o-animate-img -animate-gold c-parallax cd-inline">
                    <div class="photodaysItem-image__label hidden"><img src="/image/catalog/labels/label-finish.png" /></div>
                    <div class="c-wrap-img-anim">
                        <img class="photodaysItem-image__img" src="<?php echo $thumb; ?>" alt="<?php echo $name; ?>" />
                    </div>
                </div>
            </div>
            <div class="photodaysItem-description">
                <div class="photodaysItem-description__logo" data-top="transform: translate3d(0,-15%,0)" data-bottom="transform: translate3d(0,5%,0)">
                    <img src="<?php echo $logo; ?>" alt="<?php echo $name; ?>">
                </div>
                <div class="photodaysItem-description__description">
                    <div id="descriptionOverflow" style="height: 154px;overflow: hidden;">
                        <div>
                            <?php echo $description; ?>
                        </div>
                    </div>
                    <div class="clearfix">
                        <a href="javascript: void(0);" data-toggle="openCloseText" data-element="descriptionOverflow" data-short="Скрыть" data-action="Читать дальше" data-height="154"><span>Читать дальше</span></a>
                    </div>
                </div>
            </div>
        </div>
        <?php /**/ if ($images) { ?>
        <ul class="photodays-images">
            <?php $i = 1; foreach ($images as $image) { ?>
                <?php if ($i == 2) { ?>
                    <li class="photodays-images__item socialList hidden-xs">
                        <div class="photodays-share">
                            <span class="photodays-share__title">Поделиться:</span>
                            <div class="share42init" id="share42init" data-image="<?php echo $thumb; ?>" data-title="<?php echo $heading_title; ?>" data-description="<?php echo utf8_substr(strip_tags($description), 0, 160); ?>..."></div>
                        </div>
                    </li>
                <?php } ?>
                <li class="photodays-images__item"><a href="<?php echo $image['popup']; ?>"><img src="<?php echo $image['thumb']; ?>" alt="<?php echo $name . ' ' . $i; ?>"></a></li>
            <?php $i++; } ?>
        </ul>
        <?php } /**/ ?>
    </div>
    <?php /* ?><div class="photoday-images__overlay">
        <div class="photoday-share">
            <span class="photoday-share__title">Поделиться:</span>
            <div class="share42init" id="share42init" data-image="<?php echo $photodays['thumb']; ?>" data-title="<?php echo $photodays['name']; ?>" data-description="<?php echo utf8_substr(strip_tags($photodays['description']), 0, 160); ?>..."></div>
        </div>
        <?php if ($images) { ?>
            <?php if (!$detect->isMobile()) { ?>
                <div class="photoday-images" id="photodayImages">
                    <?php $i = 1; foreach ($images as $image) { ?>
                        <?php if ($i == 1) { ?><div class="groupItem"><?php } ?>
                        <?php if ($i == 1) { ?><div class="item item1"><?php } ?>
                        <?php if ($i == 3) { ?><div class="item item2"><?php } ?>
                        <?php if ($i == 4) { ?><div class="item item3"><?php } ?>
                        <?php if ($i == 6) { ?><div class="item item4"><?php } ?>
                        <div class="photoday-image <?php echo $i; ?>"><a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $image['thumb']; ?>" data-echo="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></div>
                        <?php if ($i == 2) { ?></div><?php } ?>
                        <?php if ($i == 3) { ?></div><?php } ?>
                        <?php if ($i == 5) { ?></div><?php } ?>
                        <?php if ($i == 6) { ?></div><?php } ?>
                        <?php if ($i == 6) { ?></div><?php } ?>
                        <?php if ($i == 6) { $i = 0; } $i++; } ?>
                </div>
            <?php } else { ?>
                <div class="photoday-images" id="photodayImages">
                    <?php foreach ($images as $image) { ?>
                        <div class="photoday-image">
                            <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $image['thumb']; ?>" data-echo="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
                        </div>
                    <?php } ?>
                </div>
            <?php } ?>
        <?php } ?>
    </div><?php */ ?>
    <div class="photodays-more">
        <a href="<?php echo $photodays; ?>" class="photodays-more__link"><span>Посмотреть ближайщие фотосессии</span></a>
        <div class="photodays-share pull-right visible-xs">
            <span class="photodays-share__title">Поделиться:</span>
            <div class="share42init" id="share42init" data-image="<?php echo $thumb; ?>" data-title="<?php echo $heading_title; ?>" data-description="<?php echo utf8_substr(strip_tags($description), 0, 160); ?>..."></div>
        </div>
    </div>
</div>
<div class="action photodays-action">
    <div class="container">
        <div class="action-overlay">
            <div class="action-text js-animate">
                <div class="c-text-masked"><span>Понравилось? Закажи себе такой образ!</span></div>
                <div class="c-text-masked"><p>Cвяжись с нами и мы поможем тебе стать звездой вечера!</p>
            </div>
            </div>
            <a href="#" class="action-link"><span>Заказать</span></a>
        </div>
    </div>
</div>
<div class="container">
    <div class="photodays-cd-pagination">
        <ul class="photodays-pagination">
            <?php if ($pagination_prev) { ?><li class="photodays-pagination__item"><a href="<?php echo $pagination_prev; ?>" class="article-pagination__link">← Предыдущая фотосессия</a></li><?php } ?>
            <?php if ($pagination_next) { ?><li class="photodays-pagination__item"><a href="<?php echo $pagination_next; ?>" class="article-pagination__link">Следующая фотосессия →</a></li><?php } ?>
        </ul>
    </div>
</div>
<?php echo $footer; ?>
