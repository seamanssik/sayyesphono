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
        <div class="row">
            <?php echo $column_left; ?>
            <div id="content" class="col-sm-9">
                <div class="category-sort">
                    <span class="category-sort__title">Сортировка:</span>
                    <ul class="category-sort__list">
                        <?php foreach ($sorts as $sorts) { ?>
                            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                                <li class="category-sort__item"><a href="<?php echo $sorts['href']; ?>" class="category-sort__link active"><?php echo $sorts['text']; ?></a></li>
                            <?php } else { ?>
                                <li class="category-sort__item"><a href="<?php echo $sorts['href']; ?>" class="category-sort__link"><?php echo $sorts['text']; ?></a></li>
                            <?php } ?>
                        <?php } ?>
                    </ul>
                </div>
                <?php if ($products) { ?>
                    <div class="row category-products">
                        <?php foreach ($products as $p => $product) { ?>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product category-product">
                                    <div class="product-promo"><?php echo $product['promotag']; ?></div>
                                    <div class="product-thumb">
                                        <img width="330" height="510" src="<?php echo $product['thumb']; ?>" style="opacity: 0; visibility: hidden;">
                                        <div id="myCarousel-<?php echo $p; ?>" class="carousel slide product-thumb__slide" data-toggle="myCarousel">
                                            <a class="right carousel-control hidden" href="#myCarousel-<?php echo $p; ?>" data-slide="next">›</a>
                                            <a class="left carousel-control hidden" href="#myCarousel-<?php echo $p; ?>" data-slide="prev">‹</a>
                                            <a href="<?php echo $product['href']; ?>">
                                            <div class="carousel-inner">
                                                <div class="item active">
                                                    <img class="show" width="330" height="510" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>">
                                                </div>
                                                <?php foreach ($product['thumbs'] as $key => $thumb) { if ($key >= 1) { continue; } ?>
                                                <div class="item">
                                                    <img width="330" height="510" src="<?php echo $thumb; ?>" alt="<?php echo $key . ' ' . $product['name']; ?>">
                                                </div>
                                                <?php } ?>
                                            </div>
                                            </a>
                                            <button type="button" data-toggle="tooltip" class="btn btn-default wishlist_item <?php echo $product['wishlist_cative']; ?>" title=""
                                                <?php if($logged == true) {?>
                                                    onclick="wishlist.add(<?php echo $product['product_id']; ?>);$(this).addClass('active');"
                                                <?php }else{ ?>
                                                    onclick="$('#modalSignIn').modal('show')"
                                                <?php };?>
                                                    data-original-title="Add to Wish List">
                                            </button>
                                        </div>
                                    </div>
                                    <div class="product-title">
                                        <a href="<?php echo $product['href']; ?>" class="product-title__link"><span><?php echo $product['name']; ?></span></a>
                                    </div>
                                    <div class="product-info hidden">
                                        <div class="product-info__rent"><?php echo $product['price']; ?><span>аренда</span></div>
                                        <div class="product-info__currency"><span style="text-transform: uppercase"><?php echo $product['symbol']; ?></span></div>
                                        <?php if ($product['price_buy']) { ?><div class="product-info__price"><?php echo $product['price_buy']; ?><span>выкуп</span></div><?php } ?>
                                    </div>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                    <?php if ($pagination) { ?>
                    <div class="category-pagination">
                        <?php echo $pagination; ?>
                    </div>
                    <?php } ?>
                <?php } else { ?>
                    <p class="text-empty"><?php echo $text_empty; ?></p>
                <?php } ?>
            </div>
        </div>
    </div>
<?php echo $content_bottom; ?>
<?php if ($description) { ?>
    <div class="welcome">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6 hidden-xs js-animate">
                    <img class="welcome-logo" src="/image/theme/logo-welcome.png" data-rjs="/image/theme/2x/logo-welcome.png" alt="Новый день, новый образ - новая ты!" title="Sey Yes! Photodays" width="491" height="188">
                    <div class="clearfix"></div>
                    <p class="welcome-alt c-text-masked"><span>Новый день, новый образ - новая ты!</span></p>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
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
    <script src="/app/js/affix.js?v=0.0.9" type="text/javascript"></script>
    <script src="/app/js/carousel.js?v=0.0.9" type="text/javascript"></script>
    <script>
        $(window).load(function () {
            var _top = parseInt($('.showroom-affix').offset().top + $('.showroom-affix').outerHeight(true)),
                _bottom = parseInt($('footer').outerHeight(true) + $('.welcome').outerHeight(true) + $('.action').outerHeight(true));

            if ($('body').outerHeight(true) > parseInt(_bottom + _top + 55)) {
                $('.showroom-affix').affix({
                    offset: {
                        top: function () {
                            return (this.top = parseInt($('.showroom-affix').offset().top - 90))
                        },
                        bottom: function () {
                            return (this.bottom = parseInt($('footer').outerHeight(true) + $('.welcome').outerHeight(true) + $('.action').outerHeight(true)) + 55)
                        }
                    }
                });
            }

            $('*[data-toggle="myCarousel"]').carousel({
                interval: false
            });

            var i;

            $('*[data-toggle="myCarousel"] > a').on("mouseover", function () {
                var control = $(this).parent().children('.carousel-control'),
                    interval = 2000;

                i = setInterval(function () {
                    control.trigger("click");
                }, interval);
                $(this).find('.item').last().addClass('active');
                $(this).find('.item').first().removeClass('active');
            }).on("mouseout", function () {
                console.log(1);
                clearInterval(i);
                $(this).find('.item').first().addClass('active');
                $(this).find('.item').last().removeClass('active');
            });
        });
    </script>
<?php echo $footer; ?>