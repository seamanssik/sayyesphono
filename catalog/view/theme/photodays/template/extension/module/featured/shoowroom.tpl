<div class="shop" id="shop">
    <div class="container">
        <div class="shop-title js-animate">
            <div class="c-text-masked"><span>—Online Shoowroom</span></div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-lg-offset-3 col-md-4 col-md-offset-4 js-animate">
                <div class="shop-description c-text-masked"><?php echo $filed_1; ?></div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-4">
                <div class="shop-controls_prev"></div>
            </div>
            <div class="col-lg-3 col-md-4">&nbsp;</div>
            <div class="col-lg-3 col-md-4">
                <div class="shop-controls_next"></div>
            </div>
        </div>
        <div class="row" id="shopOwl">
            <?php foreach ($products as $product) { ?>
            <div class="shop-col col-lg-3 col-md-4 col-sm-6">
                <div class="product">
                    <div class="product-thumb">
                        <a href="<?php echo $product['href']; ?>" class="product-thumb__link js-animate -show-from-right c-parallax is-black-n-white o-animate-img -animate-beige cd-inline">
                            <div class="c-wrap-img-anim">
                                <img width="330" height="510" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>">
                            </div>
                        </a>
                        <div class="product-thumb__mask">
                            <div class="product-thumb__info">
                                <div class="product-thumb__rent"><?php echo $product['price']; ?><span>аренда</span></div>
                                <div class="product-thumb__currency"><span style="text-transform: uppercase"><?php echo $product['symbol']; ?></span></div>
                                <?php if ($product['price_buy']) { ?><div class="product-thumb__price"><?php echo $product['price_buy']; ?><span>выкуп</span></div><?php } ?>
                            </div>
                        </div>
                    </div>
                    <div class="product-title">
                        <a href="<?php echo $product['href']; ?>" class="product-title__link"><span><?php echo $product['name']; ?></span></a>
                    </div>
                </div>
            </div>
            <?php } ?>
        </div>
    </div>
</div>