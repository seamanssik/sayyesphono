<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<?php if ($noindex) { ?>
<!-- OCFilter Start -->
<meta name="robots" content="noindex,nofollow" />
<!-- OCFilter End -->
<?php } ?>
<base href="<?php echo $base; ?>" />
<?php if(isset($extra_tags)) { foreach($extra_tags as $extra_tag) {?>
<meta <?php echo ($extra_tag['name']) ? 'name="' . $extra_tag['name'] . '" ' : ''; ?><?php echo (!in_array($extra_tag['property'], array("noprop", "noprop1", "noprop2", "noprop3", "noprop4"))) ? 'property="' . $extra_tag['property'] . '" ' : ''; ?> content="<?php echo addslashes($extra_tag['content']); ?>" />
<?php } } ?>
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link rel="icon" type="image/x-icon" href="/favicon.png" />
<link rel="apple-touch-icon" href="/image/theme/favicon_60.png">
<link rel="apple-touch-icon" sizes="76x76" href="/image/theme/favicon_76.png">
<link rel="apple-touch-icon" sizes="120x120" href="/image/theme/favicon_120.png">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link href="/library/stylesheet.css?v=0.0.9" rel="stylesheet">
<link href="/catalog/view/theme/default/stylesheet/additional_styles.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" media="all">
<script src="/library/wishlist.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
<script>
    var LANGS = {};
    <?php $arr = $languages; foreach($arr as $group => $language){ ?>LANGS['<?php echo $group?>']={};<?php foreach($language as $name_key => $value){?>LANGS['<?php echo $group?>']['<?php echo $name_key ;?>']='<?php echo $value ;?>';<?php } ?><?php } ?>
</script>
</head>
<body class="<?php echo $class; ?><?php echo (!$detect->isMobile() && !$detect->isTablet()) ? ' fixed-header' : ''; ?>">
<?php echo $login; ?>
<div class="aside">
    <div class="aside-backdrop" id="showBackdrop"></div>
    <div class="aside-overflow">
        <div class="aside-close"><span id="showClose"></span></div>
        <ul class="aside-list">
            <?php foreach ($menusLeft as $key => $menuLeft) { ?>
                <?php if ($key == 2) { ?>
                    <li class="aside-list__item"><a href="<?php echo $aside[2]; ?>" class="aside-list__link">Блог</a></li>
                <?php } ?>
                <li class="aside-list__item"><a href="<?php echo $menuLeft['href']; ?>" class="aside-list__link"><?php echo $menuLeft['name']; ?></a></li>
            <?php } ?>
            <li class="aside-list__item"><a href="/contact" class="aside-list__link">Контакты</a></li>
            <?php /* ?>
            <li class="aside-list__item"><a href="<?php echo $aside[0]; ?>" class="aside-list__link">О нас</a></li>
            <li class="aside-list__item"><a href="<?php echo $aside[1]; ?>" class="aside-list__link">FAQ</a></li>
            <li class="aside-list__item"><a href="<?php echo $aside[2]; ?>" class="aside-list__link">Блог</a></li>
            <li class="aside-list__item"><a href="<?php echo $aside[3]; ?>" class="aside-list__link">Отзывы</a></li>
            <li class="aside-list__item hidden"><a href="<?php echo $aside[4]; ?>" class="aside-list__link">Франшиза</a></li>
            <li class="aside-list__item"><a href="<?php echo $photodays; ?>" class="aside-list__link">Photodays</a></li>
            <li class="aside-list__item"><a href="<?php echo $showroom; ?>" class="aside-list__link">Showroom</a></li>
            <li class="aside-list__item"><a href="<?php echo $archive_photodays; ?>" class="aside-list__link">Архив фотосессий</a></li>
            <li class="aside-list__item"><a href="<?php echo $legend; ?>" class="aside-list__link">Легенда</a></li>
            <?php */ ?>
        </ul>
    </div>
</div>
<div class="wrapper">
    <?php if(isset($already_approve) && $already_approve == false) {?>
    <div class="head-mobile-confirm"><a href="<?php echo $action_phone;?>">ПОДТВЕРДИТЕ ТЕЛЕФОН</a></div>
    <?php };?>
    <div class="h-item__nav h-nav visible-xs">
        <button class="h-nav__button" id="showAside">
            <span class="line"></span>
            <span class="text">Меню</span>
        </button>
    </div>
    <header>
        <div class="container">
            <div class="row h-container">
                <div class="col-sm-4 hidden-xs">
                    <div class="h-item__nav h-nav">
                        <button class="h-nav__button" id="showAside">
                            <span class="line"></span>
                            <span class="text">Меню</span>
                        </button>
                    </div>
                    <ul class="h-item__phone h-phone">
                        <li>
                            <a href="tel:<?php echo trim(str_replace(' ', '', $telephone)); ?>" class="h-phone__item"><?php echo $telephone; ?></a>
                        </li>
                        <li>
                            <a href="tel:<?php echo trim(str_replace(' ', '', $telephone_2)); ?>" class="h-phone__item"><?php echo $telephone_2; ?></a>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-4">
                    <div class="h-item__logo">
                        <a href="/" class="h-logo"><img src="/image/catalog/logo.png" data-rjs="/image/theme/2x/logo.png" alt="Photodays" width="264" height="101"></a>
                    </div>
                </div>
                <div class="col-sm-4">
<!--                    <ul class="h-item__social h-social">-->
<!--                        --><?php //if ($link_in) { ?><!--<li><a href="--><?php //echo $link_in; ?><!--" rel="nofollow" target="_blank" class="h-social__item h-social__int">Photodays в Instagram</a></li>--><?php //} ?>
<!--                        --><?php //if ($link_vk) { ?><!--<li><a href="--><?php //echo $link_vk; ?><!--" rel="nofollow" target="_blank" class="h-social__item h-social__vk">Photodays Вконтакте</a></li>--><?php //} ?>
<!--                        --><?php //if ($link_fb) { ?><!--<li><a href="--><?php //echo $link_fb; ?><!--" rel="nofollow" target="_blank" class="h-social__item h-social__fb">Photodays в Facebook</a></li>--><?php //} ?>
<!--                        --><?php //if ($link_you) { ?><!--<li><a href="--><?php //echo $link_you; ?><!--" rel="nofollow" target="_blank" class="h-social__item h-social__you">Смотрите Photodays на youtube</a></li>--><?php //} ?>
<!--                    </ul>-->
                    <ul class="h-item__menu h-menu">
                        <li class="dropdown" style="margin-top: 10px">
                            <?php if ($logged) { ?>
                                <button class="dropdown-toggle n-dropdown-button" type="button" data-toggle="dropdown"><?php echo $customer_name;?></button>
                            <?php } else { ?>
                                <a href="javascript: void(0);" data-toggle="modal" data-target="#modalSignIn" class="h-menu__item">Вход</a>
                            <?php } ?>
                            <ul class="dropdown-menu dropdown-wrap">
                                <li><a href="index.php?route=account/edit">Изменить данные</a></li>
                                <li><a href="index.php?route=account/password">Изменить пароль</a></li>
                                <li><a href="index.php?route=account/order">Мои заказы</a></li>
                                <li><a href="index.php?route=account/download">Мои фото</a></li>
                                <li><a href="index.php?route=account/logout">Выход</a></li>
                            </ul>
                        </li>

                        </li>
                        <li>
                            <?php if ($logged) { ?>
                                <a href="<?php echo $wishlist; ?>" id="wishlist-total" class="h-menu__item">
                            <?php } else { ?>
                                <a href="account/login" class="h-menu__item">
                            <?php } ?>
                                <img src="image/catalog/icons/wishlist.png" alt="" width="40px" height="40px">
                                    <?php if($wishlist_total_count > 0 ){;?>
                                <span class="wish-count"><?php echo $wishlist_total_count; ?></span>
                                    <?php };?>
                            </a>
                        </li>
                        <li>
                            <button class="btn btn-primary dropdown-toggle h-menu__item" type="button" data-toggle="dropdown">
                                <img src="image/catalog/icons/cart.png" alt="" width="40px" height="40px">
                                <span class="<?php if (!$total_cart_count) { ?> hidden<?php } ?> cart-count" data-toggle="cart-total-count"><?php echo $total_cart_count; ?></span>
                            </button>
                            <ul class="dropdown-menu checkout-drop">
                                <li><a href="#">HTML</a></li>
                                <li><a href="#">CSS</a></li>
                                <li><a href="#">JavaScript</a></li>
                            </ul>
                            <span class="cart-total<?php if (!$total_cart) { ?> hidden<?php } ?>" data-toggle="cart-total"><?php echo $total_cart; ?></span>
                        </li>

<!--                        <li>-->
<!--                            <a href="--><?php //echo $checkout; ?><!--" class="h-menu__item">-->
<!--                                <img src="image/catalog/icons/cart.png" alt="" width="40px" height="40px">-->
<!--                                <span class="--><?php //if (!$total_cart_count) { ?><!-- hidden--><?php //} ?><!-- cart-count" data-toggle="cart-total-count">--><?php //echo $total_cart_count; ?><!--</span>-->
<!--                            </a>-->
<!--                            <span class="cart-total--><?php //if (!$total_cart) { ?><!--hidden--><?php //} ?><!--" data-toggle="cart-total">--><?php //echo $total_cart; ?><!--</span>-->
<!--                        </li>-->

<!--                        <li>-->
<!--                            <a href="--><?php //echo $checkout; ?><!--" class="h-menu__item">Корзина</a>-->
<!--                            <span class="cart-total--><?php //if (!$total_cart) { ?><!--hidden--><?php //} ?><!--" data-toggle="cart-total">--><?php //echo $total_cart; ?><!--</span>-->
<!--                        </li>-->
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <div class="n-container hidden-xs">
        <div class="container">
            <nav>
                <ul class="n-menu">
                    <li class="dropdown n-dropdown">
                        <button class="n-dropdown-button hvr-icon-hang" id="dPhotodays" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Photodays</button>
                        <ul class="dropdown-menu n-dropdown-menu" aria-labelledby="dLabel">
                            <li><a href="/photodays">Выбрать фотосессию</a></li>
                            <li><a href="/arhiv-fotosessij">Архив фотосессий</a></li>
                            <li><a href="/reviews">Отзывы</a></li>
                        </ul>
                    </li>
                    <li class="n-menu__item">
                        <a href="/showroom" class="n-menu__link">Showroom</a>
                    </li>
                    <li class="n-menu__item">
                        <a href="/blog" class="n-menu__link">Блог</a>
                    </li>
                    <li class="dropdown n-dropdown">
                        <button class="n-dropdown-button hvr-icon-hang" id="dAbout" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">О компании</button>
                        <ul class="dropdown-menu n-dropdown-menu" aria-labelledby="dLabel">
                            <li><a href="/legend">Легенда</a></li>
                            <li><a href="/about_us">О нас</a></li>
                            <li><a href="/faq">FAQ</a></li>
                        </ul>
                    </li>
                    <li class="n-menu__item">
                        <a href="/contact" class="n-menu__link">Контакты</a>
                    </li><?php /* ?>
                    <?php foreach ($menus as $menu) { ?>
                        <li class="n-menu__item">
                            <a href="<?php echo $menu['href']; ?>" class="n-menu__link"><?php echo $menu['name']; ?></a>
                        </li>
                    <?php } ?>
                    <li class="n-menu__item">
                        <a href="<?php echo $photodays; ?>" class="n-menu__link">Photodays</a>
                    </li>
                    <li class="n-menu__item">
                        <a href="<?php echo $showroom; ?>" class="n-menu__link">Showroom</a>
                    </li>
                    <li class="n-menu__item">
                        <a href="<?php echo $archive_photodays; ?>" class="n-menu__link">Архив фотосессий</a>
                    </li>
                    <li class="n-menu__item">
                        <a href="<?php echo $legend; ?>" class="n-menu__link">Легенда</a>
                    </li><?php */ ?>

                </ul>
            </nav>
        </div>
    </div>
    <div class="h-fixed visible-lg visible-ed visible-md">
        <div class="container">
            <button class="h-nav__button h-fixed-button" id="showAside">
                <span class="line"></span>
                <span class="text">Меню</span>
            </button>
            <ul class="h-fixed-menu left">
                <li class="h-fixed-menu__item">
                    <button class="n-dropdown-button hvr-icon-hang" id="dPhotodays" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Photodays</button>
                    <ul class="dropdown-menu n-dropdown-menu" aria-labelledby="dLabel">
                        <li><a href="/photodays">Выбрать фотосессию</a></li>
                        <li><a href="/arhiv-fotosessij">Архив фотосессий</a></li>
                        <li><a href="/reviews">Отзывы</a></li>
                    </ul>
                </li>
                <li class="h-fixed-menu__item">
                    <a href="/showroom">Showroom</a>
                </li>
            </ul>
            <div class="h-fixed-menu__logo">
                <a href="/"><img src="/image/catalog/logo.png" data-rjs="/image/theme/2x/logo.png" alt="Photodays" width="132" height="auto"></a>
            </div>
            <ul class="h-fixed-menu right">
                <li class="h-fixed-menu__item">
                    <?php if ($logged) { ?>
                        <a href="<?php echo $account; ?>"><?php echo $customer_name;?></a>
                    <?php } else { ?>
                        <a href="javascript: void(0);" data-toggle="modal" data-target="#modalSignIn">Вход</a>
                    <?php } ?>
                </li>
                <li class="h-fixed-menu__item">
                    <?php if ($logged) { ?>
                    <a href="<?php echo $wishlist; ?>" id="wishlist-total" class="h-menu__item">
                        <?php } else { ?>
                        <a href="account/login" class="h-menu__item">
                            <?php } ?>
                            <img src="image/catalog/icons/wishlist.png" alt="" width="40px" height="40px">
                            <?php if($wishlist_total_count > 0 ){;?>
                                <span class="wish-count"><?php echo $wishlist_total_count; ?></span>
                            <?php };?>
                        </a>
                </li>
                <li class="h-fixed-menu__item">
                    <a href="<?php echo $checkout; ?>"  class="h-menu__item"><img src="image/catalog/icons/cart.png" alt="" width="40px" height="40px">
                        <span class="<?php if (!$total_cart_count) { ?> hidden<?php } ?> cart-count" data-toggle="cart-total-count-2"><?php echo $total_cart_count; ?></span></a>
                </li>
            </ul>
        </div>
    </div>