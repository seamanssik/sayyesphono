<?php echo $header; ?>
    <div class="showroom-heading heading-background transparent no_margin">
        <div class="container">
            <div class="h1 js-animate"><div class="c-text-masked"><span><?php echo $heading_title; ?></span></div></div>
            <ul class="breadcrumb h1-after">
                <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
                    <?php if($i+1<count($breadcrumbs)) { ?><li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><l/i> <?php } else { ?><li class="active"><span><?php echo $breadcrumb['text']; ?></span></li><?php } ?>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div id="content" class="container">
        <div id="product" class="row cd-showroom">
            <div class="col-ed-6 col-lg-7 col-md-7 col-sm-7">
                <div class="cd-showroom-column">
                    <?php if ($manufacturer) { ?><div class="showroom-brand"><span class="title">Бренд</span> <span class="brand"><?php echo $manufacturer; ?></span></div><?php } ?>
                    <div class="showroom-description">
                        <?php echo $description; ?>
                    </div>
                    <?php if ($options) { ?>
                        <div class="showroom-options">
                            <?php foreach ($options as $option) { ?>
                                <?php // if ($option['required']) { ?>
                                <?php if ($option['type'] == 'radio') { ?>
                                <div class="product-info showroom-info">
                                    <?php foreach ($option['product_option_value'] as $key => $option_value) { ?>
                                        <?php if ($key == 0) { ?>
                                            <div class="product-info__rent"><?php echo $price; ?><span>аренда</span></div>
                                            <div class="product-info__currency"><span style="text-transform: uppercase"><?php echo $symbol; ?></span></div>
                                        <?php } ?>
                                        <?php if ($key == 1 && $option_value['price']) { ?>
                                            <div class="product-info__price"><b id="price-buy" data-price="<?php echo $price; ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-new-price="<?php echo $option_value['price']; ?>"><?php echo $price; ?></b><span>выкуп</span></div>
                                        <?php } ?>
                                    <?php } ?>
                                </div>
                                <div class="form-group showroom-options__radio" id="input-option<?php echo $option['product_option_id']; ?>">
                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                        <div class="radio">
                                            <label>
                                                <input  type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" price_prefix="<?php echo $option_value['price_prefix']; ?>" price="<?php echo $option_value['price_value']; ?>" />
                                                <?php echo $option_value['name']; ?>
                                            </label>
                                        </div>
                                    <?php } ?>
                                </div>
                            <?php } ?>
                            <?php if ($option['type'] == 'select') { ?>
                                <div class="form-group float showroom-options__select">
                                    <span class="control-label"><?php echo $option['name']; ?></span>
                                    <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>">
                                        <?php /* ?><option value=""><?php echo $text_select; ?></option><?php */ ?>
                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                <?php if ($option_value['price']) { ?>
                                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                <?php } ?>
                                            </option>
                                        <?php } ?>
                                    </select>
                                </div>
                            <?php } ?>
                            <?php if ($option['type'] == 'date') { ?>
                                <div class="form-group float showroom-options__date">
                                    <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                    <label class="date">
                                        <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" />
                                    </label>
                                </div>
                                <script>
                                    $(function() {
                                        $('#input-option<?php echo $option['product_option_id']; ?>').datetimepicker({
                                            locale: 'ru',
                                            minDate: 0,
                                            dayOfWeekStart: 1,
                                            timepicker: false,
                                            value: '12.03.2013',
                                            defaultDate: new Date(),
                                            format: 'Y-m-d',
                                            formatDate: 'Y-m-d',
                                            <?php if ($option['multiple_date']) { ?>disabledDates: [<?php foreach ( explode(',', $option['multiple_date']) as $value) { echo "'" . $value , "', "; } ?>],<?php } ?>
                                            defaultSelect: false,
                                            scrollMonth: false
                                        });
                                    });
                                </script>
                            <?php } ?>
                                <?php // } ?>
                            <?php } ?>
                        </div>
                        <?php foreach ($options as $option) { ?>
                            <?php if ($option['type'] == 'image') { ?>
                                <div class="showroom-fashion">
                                    <div class="showroom-fashion__title">Завершите образ:</div>
                                    <div id="input-option<?php echo $option['product_option_id']; ?>" class="row showroom-fashion__items">
                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 fashion-item">
                                                <label class="fashion-thumb">
                                                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-responsive" width="130" height="130">
                                                    <span class="fashion-thumb__title"><?php echo $option_value['name']; ?></span>
                                                    <?php if ($option_value['price']) { ?><span class="fashion-thumb__price"><span><?php echo $option_value['price_prefix'] . $option_value['price']; ?></span></span><?php } ?>
                                                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" price_prefix="<?php echo $option_value['price_prefix']; ?>" price="<?php echo $option_value['price_value']; ?>" />
                                                </label>
                                            </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            <?php } ?>
                        <?php } ?>
                    <?php } ?>
                    <div class="showroom-total">
                        <input type="hidden" name="quantity" value="<?php echo $minimum; ?>" />
                        <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                        <div class="showroom-total__title">Итого:</div>
                        <div class="showroom-total__action">
                            <div class="showroom-total__price"><span id="formated_price" price="<?php echo $price_value; ?>"><?php echo $price; ?></span> <small><?php echo ($currency['symbol_left']) ? $currency['symbol_left'] : $currency['symbol_right']; ?></small></div>
                            <button type="button" id="button-cart" data-product-id="<?php echo $product_id; ?>" class="showroom-total__order"><span>Заказать</span></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-ed-5 col-ed-offset-1 col-lg-5 col-lg-offset-0 col-md-5 col-sm-5">
                <button type="button" data-toggle="tooltip" class="btn btn-default wishlist_item <?php echo $wishlist_active; ?>" title=""
                        <?php if($logged == true) {?>
                            onclick="wishlist.add(<?php echo $product_id; ?>);$(this).addClass('active');"
                        <?php }else{ ?>
                            onclick="window.location.href = 'account/login'"
                        <?php };?>
                        data-original-title="Add to Wish List">
                </button>
                <div class="showroom-images" id="showroomImages">
                    <?php if ($thumb) { ?>
                        <div class="showroom-image"><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" data-echo="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></div>
                    <?php } ?>
                    <?php if ($images) { ?>
                        <?php foreach ($images as $image) { ?>
                            <div class="showroom-image"><a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $image['thumb']; ?>" data-echo="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></div>
                        <?php } ?>
                    <?php } ?>
                </div>
                <div class="showroom-share">
                    <span class="showroom-share__title hidden-sm">Поделиться:</span>
                    <div class="share42init" id="share42init" data-image="<?php echo $thumb; ?>" data-title="<?php echo $heading_title; ?>" data-description="<?php echo utf8_substr(strip_tags($description), 0, 160); ?>..."></div>
                </div>
            </div>
        </div>
        <?php if ($product_reviews) { ?>
            <div class="showroom-experts">
                <div class="showroom-carousels" id="showroomCarousels">
                    <?php foreach ($product_reviews as $product_review) { ?>
                        <div class="showroom-expert">
                            <div class="row">
                                <div class="col-ed-4 col-ed-offset-2 col-lg-5 col-lg-offset-1 col-md-6 col-sm-6">
                                    <div class="showroom-expert__title"><span>Что говорят эксперты</span></div>
                                    <div class="showroom-expert__review">
                                        <?php echo $product_review['review']; ?>
                                    </div>
                                    <div class="showroom-expert__name"><?php echo $product_review['expert']; ?></div>
                                    <div class="showroom-expert__position"><?php echo $product_review['position']; ?></div>
                                </div>
                                <div class="col-ed-5 col-ed-offset-1 col-lg-6 col-lg-offset-0 col-md-6 col-sm-6">
                                    <figure>
                                        <img src="<?php echo $product_review['thumb']; ?>" width="399" height="579" alt="<?php echo $product_review['expert']; ?> - <?php echo $product_review['position']; ?>">
                                    </figure>
                                </div>
                            </div>
                        </div>
                    <?php } ?>
                </div>
                <div class="showroom-controls row">
                    <div class="col-ed-4 col-ed-offset-2 col-lg-5 col-lg-offset-1 col-md-6">
                        <div class="showroom-expert__controls"></div>
                    </div>
                </div>
            </div>
        <?php } ?>
        <?php if ($products) { ?>
            <div class="showroom-related">
                <div class="showroom-related__title js-animate"><div class="c-text-masked"><span>Тебе также понравится</span></div></div>
                <div class="row">
                    <div id="showroom-related">
                        <?php foreach ($products as $product) { ?>
                            <div class="product category-product">
                                <div class="product-promo"><?php echo $product['promotag']; ?></div>
                                <div class="product-thumb">
                                    <a href="<?php echo $product['href']; ?>" class="product-thumb__link">
                                        <img width="330" height="510" src="image/catalog/blank.gif" data-echo="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>">
                                    </a>
                                </div>
                                <div class="product-title">
                                    <a href="<?php echo $product['href']; ?>" class="product-title__link"><span class="small"><?php echo $product['name']; ?></span></a>
                                </div>
                                <div class="product-info hidden">
                                    <div class="product-info__rent"><?php echo $product['price']; ?><span>аренда</span></div>
                                    <div class="product-info__currency"><span style="text-transform: uppercase"><?php echo $product['symbol']; ?></span></div>
                                    <div class="product-info__price">3500<span>выкуп</span></div>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                </div>
            </div>
        <?php } ?>
    </div>
<?php echo $content_bottom; ?>
    <script type="text/javascript"><!--
        function price_format(n) {
            c = <?php echo (empty($currency['decimals']) ? "0" : $currency['decimals'] ); ?>;
            d = '<?php echo $currency['decimal_point']; ?>'; // decimal separator
            t = '<?php echo $currency['thousand_point']; ?>'; // thousands separator
            s_left = '<?php echo $currency['symbol_left']; ?>';
            s_right = '<?php echo $currency['symbol_right']; ?>';

            n = n * <?php echo $currency['value']; ?>;

            //sign = (n < 0) ? '-' : '';

            //extracting the absolute value of the integer part of the number and converting to string
            i = parseInt(n = Math.abs(n).toFixed(c)) + '';

            j = ((j = i.length) > 3) ? j % 3 : 0;
            return s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : ''); //  + s_right
        }

        function calculate_tax(price) {
            <?php // Process Tax Rates
            if (isset($tax_rates) && $tax) {
                foreach ($tax_rates as $tax_rate) {
                    if ($tax_rate['type'] == 'F') {
                        echo 'price += '.$tax_rate['rate'].';';
                    } elseif ($tax_rate['type'] == 'P') {
                        echo 'price += (price * '.$tax_rate['rate'].') / 100.0;';
                    }
                }
            }
            ?>
            return price;
        }

        function process_discounts(price, quantity) {
            <?php
            foreach ($dicounts_unf as $discount) {
                echo 'if ((quantity >= '.$discount['quantity'].') && ('.$discount['price'].' < price)) price = '.$discount['price'].';'."\n";
            }
            ?>
            return price;
        }

        animate_delay = 20;

        main_price_final = calculate_tax(Number($('#formated_price').attr('price')));
        main_price_start = calculate_tax(Number($('#formated_price').attr('price')));
        main_step = 0;
        main_timeout_id = 0;

        function animateMainPrice_callback() {
            main_price_start += main_step;

            if ((main_step > 0) && (main_price_start > main_price_final)){
                main_price_start = main_price_final;
            } else if ((main_step < 0) && (main_price_start < main_price_final)) {
                main_price_start = main_price_final;
            } else if (main_step == 0) {
                main_price_start = main_price_final;
            }

            $('#formated_price').html( price_format(main_price_start) );

            if (main_price_start != main_price_final) {
                main_timeout_id = setTimeout(animateMainPrice_callback, animate_delay);
            }
        }

        function animateMainPrice(price) {
            main_price_start = main_price_final;
            main_price_final = price;
            main_step = (main_price_final - main_price_start) / 10;

            clearTimeout(main_timeout_id);
            main_timeout_id = setTimeout(animateMainPrice_callback, animate_delay);
        }


        <?php if ($special) { ?>
        special_price_final = calculate_tax(Number($('#formated_special').attr('price')));
        special_price_start = calculate_tax(Number($('#formated_special').attr('price')));
        special_step = 0;
        special_timeout_id = 0;

        function animateSpecialPrice_callback() {
            special_price_start += special_step;

            if ((special_step > 0) && (special_price_start > special_price_final)){
                special_price_start = special_price_final;
            } else if ((special_step < 0) && (special_price_start < special_price_final)) {
                special_price_start = special_price_final;
            } else if (special_step == 0) {
                special_price_start = special_price_final;
            }

            $('#formated_special').html( price_format(special_price_start) );

            if (special_price_start != special_price_final) {
                special_timeout_id = setTimeout(animateSpecialPrice_callback, animate_delay);
            }
        }

        function animateSpecialPrice(price) {
            special_price_start = special_price_final;
            special_price_final = price;
            special_step = (special_price_final - special_price_start) / 10;

            clearTimeout(special_timeout_id);
            special_timeout_id = setTimeout(animateSpecialPrice_callback, animate_delay);
        }
        <?php } ?>


        function recalculateprice() {
            var main_price = Number($('#formated_price').attr('price'));
            var input_quantity = Number($('input[name="quantity"]').val());
            var special = Number($('#formated_special').attr('price'));
            var tax = 0;

            if (isNaN(input_quantity)) input_quantity = 0;

            // Process Discounts.
            <?php if ($special) { ?>
            special = process_discounts(special, input_quantity);
            <?php } else { ?>
            main_price = process_discounts(main_price, input_quantity);
            <?php } ?>
            tax = process_discounts(tax, input_quantity);


            <?php if ($points) { ?>
            var points = Number($('#formated_points').attr('points'));
            $('input:checked,option:selected').each(function() {
                if ($(this).attr('points')) points += Number($(this).attr('points'));
            });
            $('#formated_points').html(Number(points));
            <?php } ?>

            var option_price = 0;

            $('input:checked,option:selected').each(function() {
                if ($(this).attr('price_prefix') == '=') {
                    option_price += Number($(this).attr('price'));
                    main_price = 0;
                    special = 0;
                }
            });

            $('input:checked,option:selected').each(function() {
                if ($(this).attr('price_prefix') == '+') {
                    option_price += Number($(this).attr('price'));
                }
                if ($(this).attr('price_prefix') == '-') {
                    option_price -= Number($(this).attr('price'));
                }
                if ($(this).attr('price_prefix') == 'u') {
                    pcnt = 1.0 + (Number($(this).attr('price')) / 100.0);
                    option_price *= pcnt;
                    main_price *= pcnt;
                    special *= pcnt;
                }
                if ($(this).attr('price_prefix') == '*') {
                    option_price *= Number($(this).attr('price'));
                    main_price *= Number($(this).attr('price'));
                    special *= Number($(this).attr('price'));
                }
            });

            special += option_price;
            main_price += option_price;

            <?php if ($special) { ?>
            tax = special;
            <?php } else { ?>
            tax = main_price;
            <?php } ?>

            // Process TAX.
            main_price = calculate_tax(main_price);
            special = calculate_tax(special);

            // Раскомментировать, если нужен вывод цены с умножением на количество
//            main_price *= input_quantity;
//            special *= input_quantity;
//            tax *= input_quantity;

            // Display Main Price
            //$('#formated_price').html( price_format(main_price) );
            animateMainPrice(main_price);

            <?php if ($special) { ?>
            //$('#formated_special').html( price_format(special) );
            animateSpecialPrice(special);
            <?php } ?>

            <?php if ($tax) { ?>
            $('#formated_tax').html( price_format(tax) );
            <?php } ?>
        }

        $(document).ready(function() {
            $('input[type="checkbox"]').bind('change', function() { recalculateprice(); });
            $('input[type="radio"]').bind('change', function() { recalculateprice(); });
            $('select').bind('change', function() { recalculateprice(); });

            $quantity = $('input[name="quantity"]');
            $quantity.data('val', $quantity.val());
            (function() {
                if ($quantity.val() != $quantity.data('val')){
                    $quantity.data('val',$quantity.val());
                    recalculateprice();
                }
                setTimeout(arguments.callee, 250);
            })();

            recalculateprice();
        });
        //--></script>
<?php echo $footer; ?>