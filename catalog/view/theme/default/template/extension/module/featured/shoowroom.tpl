<div class="shop" id="shop">
    <div class="container">
        <div class="shop-title">—Online Shoowroom</div>
        <div class="row">
            <div class="col-lg-3 col-lg-offset-3">
                <div class="shop-description"><?php echo $filed_1; ?></div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                <div class="shop-controls_prev"></div>
            </div>
            <div class="col-lg-3">&nbsp;</div>
            <div class="col-lg-3">
                <div class="shop-controls_next"></div>
            </div>
        </div>
        <div class="row" id="shopOwl">
            <?php foreach ($products as $product) { ?>
            <div class="shop-col col-lg-3">
                <div class="product">
                    <div class="product-thumb">
                        <a href="<?php echo $product['href']; ?>" class="product-thumb__link"><img width="330" height="510" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></a>
                        <div class="product-thumb__mask">
                            <div class="product-thumb__info">
                                <div class="product-thumb__rent">1400<span>аренда</span></div>
                                <div class="product-thumb__currency"><span>UAH</span></div>
                                <div class="product-thumb__price">3500<span>выкуп</span></div>
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