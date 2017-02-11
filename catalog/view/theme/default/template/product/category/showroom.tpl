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
                        <?php foreach ($products as $product) { ?>
                            <div class="col-xs-4">
                                <div class="product category-product">
                                    <div class="product-thumb">
                                        <a href="<?php echo $product['href']; ?>" class="product-thumb__link">
                                            <img width="330" height="510" src="image/catalog/blank.gif" data-echo="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>">
                                        </a>
                                    </div>
                                    <div class="product-title">
                                        <a href="<?php echo $product['href']; ?>" class="product-title__link"><span><?php echo $product['name']; ?></span></a>
                                    </div>
                                    <div class="product-info">
                                        <div class="product-info__rent"><?php echo $product['price']; ?><span>аренда</span></div>
                                        <div class="product-info__currency"><span style="text-transform: uppercase"><?php echo $product['symbol']; ?></span></div>
                                        <div class="product-info__price">3500<span>выкуп</span></div>
                                    </div>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                    <div class="category-pagination">
                        <?php echo $pagination; ?>
                    </div>
                <?php } else { ?>
                    <p><?php echo $text_empty; ?></p>
                <?php } ?>
            </div>
        </div>
    </div>
<?php echo $content_bottom; ?>
<?php if ($description) { ?>
    <div class="welcome">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 js-animate">
                    <img class="welcome-logo" src="/image/theme/logo-welcome.png" alt="Новый день, новый образ - новая ты!" title="Sey Yes! Photodays" width="491" height="188">
                    <div class="clearfix"></div>
                    <p class="welcome-alt c-text-masked"><span>Новый день, новый образ - новая ты!</span></p>
                </div>
                <div class="col-lg-6">
                    <div class="welcome-text">
                        <?php if($heading_title) { ?>
                            <div class="welcome-text__title js-animate"><div class="c-text-masked"><span><?php echo $heading_title; ?></span></div></div>
                        <?php } ?>
                        <div class="welcome-text__description">
                            <?php echo $description; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php } ?>
<?php echo $footer; ?>