<?php echo $header; ?>
<?php if ($attribute_groups): ?>
    <div class="modal fade" id="modalInfo" tabindex="-1" role="dialog" aria-labelledby="modalInfo">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                    <div class="modal-title"><span>Информация</span></div>
                </div>
                <div class="modal-body modal-text">
                    <?php foreach ($attribute_groups as $attribute_group) { ?>
                    <dl class="dl-horizontal">
                        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                        <dt><?php echo $attribute['name']; ?>:</dt>
                        <dd><?php echo $attribute['text']; ?></dd>
                        <?php } ?>
                    </dl>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
<?php endif; ?>
<div id="content">
<div class="showroom-heading short-heading heading-background transparent no_margin">
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
    <div class="photoday-short">
        <div class="photodaysItem-overlay photoday-overlay">
            <div class="photodaysItem-figure photoday-figure">
                <div class="photodaysItem-date js-animate">
                    <div class="photodaysItem-date__item">
                        <span class="city"><b><?php echo $photodays['city']; ?></b></span>
                        <span class="date"><?php echo $photodays['date']; ?></span>
                        <span class="year"><?php echo $photodays['year']; ?></span>
                    </div>
                </div>
                <div class="photodaysItem-image js-animate -show-from-top o-animate-img -animate-gold c-parallax cd-inline">
                    <div class="photodaysItem-image__label hidden"><img src="/image/catalog/labels/label-finish.png" /></div>
                    <div class="c-wrap-img-anim">
                        <button type="button" data-toggle="tooltip" class="btn btn-default wishlist_item <?php echo $wishlist_active; ?>" title=""
                                <?php if($logged == true) {?>
                                onclick="wishlist.add(<?php echo $product_id; ?>);$(this).addClass('active');"
                                <?php }else{ ?>
                                onclick="$('#modalSignIn').modal('show')"
                                <?php };?>
                                data-original-title="Add to Wish List">
                        </button>
                        <img class="photodaysItem-image__img" src="<?php echo $photodays['thumb']; ?>" alt="<?php echo $photodays['name']; ?>" />
                    </div>
                </div>
            </div>
            <div class="photodaysItem-description">
                <div class="photodaysItem-description__logo" data-top="transform: translate3d(0,-20%,0)" data-bottom="transform: translate3d(0,7%,0)">
                    <img src="<?php echo $photodays['logo']; ?>" alt="<?php echo $photodays['name']; ?>">
                </div>
                <div class="photodaysItem-description__description">
                    <div id="descriptionOverflow" style="height: 154px;overflow: hidden;">
                        <div>
                            <?php $pos = strpos($photodays['description'], ' ', 500);
                            echo substr($photodays['description'], 0, $pos ) ;?>
<!--                            --><?php //echo $photodays['description']; ?>
                        </div>
                    </div>
                    <div class="clearfix">
                        <a href="javascript: void(0);" id="moreButton"><span id="hide-button-text">Читать дальше</span></a>
<!--                        <a href="javascript: void(0);" data-toggle="openCloseText" data-element="descriptionOverflow" data-short="Скрыть" data-action="Читать дальше" data-height="154"><span>Читать дальше</span></a>-->
                        <?php if ($attribute_groups): ?><div class="pull-right">
                            <a href="javascript: void(0);" data-toggle="modal" data-target="#modalInfo"><span>Информация</span></a>
                        </div><?php endif; ?>
<!--                        <button id=moreButton>кнопочкеее</button>-->
                    </div>
                </div>
                <div class="showroom-total photodaysTotal">
                    <div class="showroom-total__action">
                        <div class="showroom-total__price">
                            <span><?php echo $photodays['price']; ?></span> <small><?php echo ($photodays['symbol_left']) ? $photodays['symbol_left'] : $photodays['symbol_right']; ?></small>
                        </div>
                        <button type="button" class="showroom-total__order"><span>Заказать</span></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $('#moreButton').click(function() {
            if($('#hide-button-text').text() == 'Читать далее'){
                $('#hide-button-text').text('Читать далее');
            }else{
                $('#hide-button-text').text('Свернуть');
            }

            top.$('#panel').toggle(function () {
                    $(this).animate({
                        // style change
                    }, 500);
                },
                function () {
                    $(this).animate({
                        // style change back
                    }, 500);
                });
        });
    </script>
    <div style="display: none;" id="panel" class="photodaysItem-overlay-hidden">
        <div class="photodaysItem-hide-text">
            <div class="item-text-phodotay">
                <?php echo $photodays['description'] ;?>
            </div>
        </div>
        <div class="photodaysItem-attr">
            <?php foreach ($attribute_groups as $attribute_group) { ?>
                <table width="100%" class="table-hover table-striped">
                    <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                        <tr>
                        <td><?php echo $attribute['name']; ?></td>
                        <td><?php echo $attribute['text']; ?></td>
                        </tr>
                    <?php } ?>
                </table>
            <?php } ?>
        </div>
    </div>
    <div class="photoday-images__overlay">
        <div class="photoday-share">
            <span class="photoday-share__title">Поделиться:</span>
            <div class="share42init" id="share42init" data-image="<?php echo $photodays['thumb']; ?>" data-title="<?php echo $photodays['name']; ?>" data-description="<?php echo utf8_substr(strip_tags($photodays['description']), 0, 160); ?>..."></div>
        </div>
        <?php if ($photodays['images']) { ?>
            <?php if (!$detect->isMobile()) { ?>
            <div class="photoday-images" id="photodayImages">
            <?php $i = 1; foreach ($photodays['images'] as $image) { ?>
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
                    <?php foreach ($photodays['images'] as $image) { ?>
                        <div class="photoday-image">
                            <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $image['thumb']; ?>" data-echo="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
                        </div>
                    <?php } ?>
                </div>
            <?php } ?>
        <?php } ?>
    </div>
</div>
<?php if (!empty($product_studios)) { ?>
<div class="photoday-studio hidden-sm" id="photodayStudio">
    <?php foreach ($product_studios as $product_studio) { ?>
    <div class="photoday-studio__item">
        <img src="<?php echo $product_studio['thumb']; ?>" alt="<?php echo $product_studio['name']; ?>">
        <div class="photoday-studio__container">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="photoday-studio__header">
                            <span class="studio"><?php echo $product_studio['title']; ?></span>
                            <span class="name"><?php echo $product_studio['name']; ?></span>
                        </div>
                        <div class="photoday-studio__body">
                            <?php echo $product_studio['text']; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php } ?>
</div>
<?php } ?>
<?php if ($options) { ?>
    <div class="container photodays-product-block-margin" id="product">
        <div class="photoday-order">
            <div class="photoday-form">
                <div class="photoday-order__title js-animate">
                    <div class="c-text-masked">
                        <span>СТАНЬ ДИЗАЙНЕРОМ своего образа!</span>
                        <p>Выбери ту вариацию образа, которая подходит именно тебе</p>
                    </div>
                </div>
                <?php foreach ($options as $option) { ?>
                    <?php if ($option['type'] == 'image') { ?>
                        <div id="input-option<?php echo $option['product_option_id']; ?>" class="photoday-form__items">
                            <?php $i= 1; foreach ($option['product_option_value'] as $option_value) { ?>
                                <label class="photoday-form__item">
                                    <span class="text"><?php echo $i; ?></span>
                                    <img src="<?php echo $option_value['product_option_image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-responsive" width="194" height="300">
                                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" price_prefix="<?php echo $option_value['price_prefix']; ?>" price="<?php echo $option_value['price_value']; ?>" />
                                </label>
                            <?php $i++; } ?>
                        </div>
                    <?php } ?>
                    <?php } ?>
            </div>
            <div class="photoday-order__title js-animate">
                <div class="c-text-masked">
                    <span>Ждем Вас!</span>
                </div>
            </div>
            <input type="hidden" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
            <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
            <div class="photoday-options">
                <?php foreach ($options as $option) { ?>
                    <?php if ($option['type'] == 'select') { ?>
                        <div class="form-group float photoday-options__select">
                            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
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
                    <?php if ($option['type'] == 'datetime') { ?>
                        <div class="form-group float showroom-options__date">
                            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <div class="datetime">
                                <input id="input-option<?php echo $option['product_option_id']; ?>" type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" />
                            </div>
                        </div>
                        <script>
                            $(function() {
                                $('#input-option<?php echo $option['product_option_id']; ?>').datetimepicker({
                                    locale: 'ru',
                                    minDate: 0,
                                    value: '12.03.2013',
                                    defaultTime: '12:00',
                                    defaultDate: new Date(),
                                    format: 'Y-m-d H:i',
                                    formatDate: 'Y-m-d',
                                    allowTimes:[
                                        '12:00', '13:00', '15:00',
                                        '17:00', '17:05', '17:20', '19:00', '20:00'
                                    ],
                                    defaultSelect: false,
                                    scrollMonth: false
                                });
                            });
                        </script>
                    <?php } ?>
                <?php } ?>
                <button type="button" id="buttonPhotoDay" class="photoday-order__button" data-loading-text="<?php echo $text_loading; ?>"><span>Заказать</span></button>
            </div>
        </div>
    </div>
<?php } ?>
<?php if ($product_reviews) { ?>
    <div class="container">
        <div class="showroom-experts">
            <div class="showroom-carousels" id="showroomCarousels">
                <?php foreach ($product_reviews as $product_review) { ?>
                    <div class="showroom-expert">
                        <div class="row">
                            <div class="col-ed-4 col-ed-offset-2 col-lg-5 col-lg-offset-1 col-md-6">
                                <div class="showroom-expert__title"><span>Что говорят эксперты</span></div>
                                <div class="showroom-expert__review">
                                    <?php echo $product_review['review']; ?>
                                </div>
                                <div class="showroom-expert__name"><?php echo $product_review['expert']; ?></div>
                                <div class="showroom-expert__position"><?php echo $product_review['position']; ?></div>
                            </div>
                            <div class="col-ed-5 col-ed-offset-1 col-lg-6 col-lg-offset-0 col-md-6">
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
    </div>
<?php } ?>
<?php if (!empty($history_title)) { ?>
<div class="photoday-history" style="margin-top: -100px">
    <div class="container">
        <div class="photoday-history__title js-animate"><div class="c-text-masked"><span><?php echo $history_title; ?></span></div></div>
        <div class="photoday-history__container">
            <div class="row">
                <div class="col-ed-6 col-lg-5 col-md-5 hidden-sm hidden-xs">
                    <div class="photoday-history__image">
                        <img src="<?php echo $photodays['history_thumb']; ?>" alt="<?php echo $history_title; ?>" class="img-responsive">
                    </div>
                    <a href="<?php echo $history_link; ?>" class="photoday-history__link"><span>Читать больше</span></a>
                </div>
                <div class="col-ed-6 col-lg-7 col-md-7 col-sm-12">
                    <div class="photoday-history__quote">
                        <?php echo $history_text; ?>
                    </div>
                    <div class="visible-sm-block visible-xs-block">
                        <a href="<?php echo $history_link; ?>" class="photoday-history__link"><span>Читать больше</span></a>
                    </div>
                    <div class="photoday-history__author">
                        <span><?php echo $history_signature; ?></span>
                    </div>
                    <div class="photoday-history__video">
                        <div class="photoday-history__video-mask">
                            <?php echo $history_video; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php } ?>
<?php echo $content_bottom; ?>
</div>
    <script>
        $(document).on('click', '#buttonPhotoDay', function () {
            // << Related Options / Связанные опции
            <?php
            if ( isset($ro_installed) && $ro_installed ) {
            if (isset($ro_settings['stock_control']) && $ro_settings['stock_control'] && isset($ro_array) && $ro_array ) {
            ?>

            if (!$('#buttonPhotoDay').attr('allow_add_to_cart')) {
                stock_control(1);
                return;
            }

            $('#buttonPhotoDay').attr('allow_add_to_cart','');

            <?php
            }
            }
            ?>
            // >> Related Options / Связанные опции

            $.ajax({
                url: 'index.php?route=checkout/cart/add',
                type: 'post',
                data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
                dataType: 'json',
                success: function (json) {
                    $('.form-group, .photoday-form').removeClass('has-error');

                    if (json['error']) {
                        if (json['error']['option']) {
                            for (i in json['error']['option']) {
                                var element = $('#input-option' + i.replace('_', '-'));

                                element.parent().addClass('has-error');
                            }
                        }
                        if ( is.not.mobile() ) {
                            $('body').animate({scrollTop: _body.find('.has-error').first().offset().top - 90}, 'slow');
                        } else {
                            $('body').animate({scrollTop: _body.find('.has-error').first().offset().top}, 'slow');
                        }
                    }
                    if (json['success']) {
                        _body.find('#modalSuccess .modalSuccess-text').html('Ваш заказ добавлен в <a href="/checkout">корзину покупок</a>.');
                        _body.find('#modalSuccess').modal('show');

                        _body.find('*[data-toggle="cart-total"]').removeClass('hidden').text(json['total']);
                        _body.find('*[data-toggle="cart-total-count"]').removeClass('hidden').text(json['total_items_count']);
                        _body.find('*[data-toggle="cart-total-count-2"]').removeClass('hidden').text(json['total_items_count']);
                    }
                }
            });
        });
    </script>

    <!-- Related Options / Связанные опции << -->
    <script type="text/javascript">
        <?php
        // << Product Image Option DropDown compatibility
        if ( isset($text_select_your) && isset($options) && is_array($options) ) {
            echo "var ro_piodd_select_texts = [];\n";
            foreach ($options as $option) {
                if ($option['type'] == 'image') {
                    echo "ro_piodd_select_texts[".$option['product_option_id']."] = '".$text_select_your.$option['name']."';\n";
                }
            }

        }
        // >> Product Image Option DropDown compatibility
        ?>

        // << Product Image Option DropDown compatibility
        function ro_piodd_set_value(product_option_id, value) {

            var radio_elems = $('input[type=radio][name="'+option_prefix+'['+product_option_id+']"]');
            if (radio_elems.length) {
                var piodd_option_div = radio_elems.closest('div[id^=option-]').find('[id^=image-option]');
                if (piodd_option_div.length) {

                    piodd_option_div.find('a.dd-option').removeClass('dd-option-selected');
                    piodd_option_div.find('input.dd-selected-value').val(value);
                    if (value) {
                        var piodd_selected_a = piodd_option_div.find('input.dd-option-value[value='+value+']').parent().addClass('dd-option-selected');
                        piodd_option_div.find('a.dd-selected').html('');
                        piodd_option_div.find('a.dd-selected').append( piodd_selected_a.find('img').clone().removeClass('dd-option-image').addClass('dd-selected-image') );
                        piodd_option_div.find('a.dd-selected').append( piodd_selected_a.find('label').clone().removeClass('dd-option-text').addClass('dd-selected-text') );
                    } else {
                        if (ro_piodd_select_texts[product_option_id]) {
                            piodd_option_div.find('a.dd-selected').html(ro_piodd_select_texts[product_option_id]);
                        }
                    }
                }
            }

        }
        // >> Product Image Option DropDown compatibility


        function clear_options() {

            // << Product Image Option DropDown compatibility
            options = $('input[type=radio][name^="'+option_prefix+'"]:checked');
            for (i=0;i<options.length;i++) {

                var product_option_id = ro_get_product_option_id_from_name($(options[i]).attr('name'));
                ro_piodd_set_value(product_option_id, '');
            }
            // >> Product Image Option DropDown compatibility

            $('input[type=radio][name^="'+option_prefix+'"]').attr('checked', false);

            $('select[name^="'+option_prefix+'"]').val('');

            $('textarea[name^="'+option_prefix+'"]').val('')

            $('input[type=text][name^="'+option_prefix+'"]').val('');

            $('input[type=checkbox][name^="'+option_prefix+'"]').attr('checked', false);

            $('input[type=hidden][name^="'+option_prefix+'"]').val('')

            options_values_access();
            set_block_options();
            set_journal2_options();

            $('#input-quantity').trigger('change');

            <?php if (isset($ro_theme_name) && $ro_theme_name=='journal2') { ?>
            if (Journal.updatePrice) {
                Journal.updateProductPrice();
            }
            <?php } ?>

            return false;
        }

        // Product Block Option & Product Color Option compatibility
        function set_block_options() {
            if (use_block_options) {

                // Product Block Option & Product Color Option text clear
                $('.option span[id^="option-text-"]').html('');

                $('select[name^="'+option_prefix+'["]').find('option').each( function () {
                    var poid = ro_get_product_option_id_from_name($(this).parent().attr('name'));
                    //$(this).parent().attr('name').substr(7, $(this).parent().attr('name').length-8);

                    // Product Block Option
                    // выключаем все блоки для SELECT
                    $('a[id^="block-"][option-text-id$="-'+poid+'"]').removeClass('block-active');
                    if ($(this).parent().val()) {
                        $('a[id^="block-"][option-text-id$="-'+poid+'"][option-value="'+$(this).parent().val()+'"]').addClass('block-active').click();
                    }

                    // Product Color Option
                    $('a[id^="color-"][option-text-id$="-'+poid+'"]').removeClass('color-active');
                    if ($(this).parent().val()) {
                        $('a[id^="color-"][option-text-id$="-'+poid+'"][optval="'+$(this).parent().val()+'"]').addClass('color-active').click();
                    }

                });

                // block options use RADIOs for images
                $('input[type=radio][name^="'+option_prefix+'["]').each( function () {
                    var poid = ro_get_product_option_id_from_name($(this).attr('name'));
                    //$(this).attr('name').substr(7, $(this).attr('name').length-8);

                    // Product Block Option
                    // выключаем только текущий блок для RADIO
                    $('a[id^="block-"][option-text-id$="-'+poid+'"][option-value="'+$(this).val()+'"]').removeClass('block-active');
                    if ($(this).is(':checked')) {
                        $('a[id^="block-"][option-text-id$="-'+poid+'"][option-value="'+$(this).val()+'"]').addClass('block-active').click();
                    }

                    // Product Color Option
                    $('a[id^="color-"][option-text-id$="-'+poid+'"][optval="'+$(this).val()+'"]').removeClass('color-active');
                    if ($(this).is(':checked')) {
                        $('a[id^="color-"][option-text-id$="-'+poid+'"][optval="'+$(this).val()+'"]').addClass('color-active').click();

                    }
                });
            }
        }
    </script>

    <?php
    //$this->load->model('module/related_options');
    //if (	$this->model_module_related_options->installed() ) {
    if ( isset($ro_installed) &&	$ro_installed ) {

        if (isset($ro_array)) {

            $variant_product_options_values = "";
            if (isset($variant_product_options) && is_array($variant_product_options)) {
                foreach ($variant_product_options as $product_option_id) {
                    $variant_product_options_values.= ($variant_product_options_values=="" ? "" : ",") . $product_option_id;
                }
            }

            ?>

            <style>
                .ro_option_disabled { color: #e1e1e1; }
            </style>

        <?php if ( $ro_theme_name == 'theme638' ) { ?>
            <script src="catalog/view/theme/theme638/js/jquery.selectbox-0.2.min.js" type="text/javascript"></script>
            <style>
                .sbDisabled { padding-left:10px; padding-top:8px; padding-bottom:8px; opacity:0.4; line-height:37px; }
            </style>
        <?php } ?>

            <script type="text/javascript">

                var hide_inaccessible = <?php if (isset($ro_settings['hide_inaccessible']) && $ro_settings['hide_inaccessible']) echo "true"; else echo "false"; ?>;
                var ro_settings = <?php echo json_encode($ro_settings); ?>;
                var options_types = [];
                var variant_product_options = [<?php echo $variant_product_options_values; ?>];
                var ro_step_by_step = <?php if (isset($ro_settings['step_by_step']) && $ro_settings['step_by_step']) echo "true"; else echo "false"; ?>;
                var auto_select_last = <?php if (isset($ro_settings['select_first']) && $ro_settings['select_first'] == 2) echo "true"; else echo "false"; ?>;
                var use_block_options = ($('a[id^=block-option][option-value]').length || $('a[id^=block-image-option][option-value]').length || $('a[id^=color-][optval]').length);
                var use_journal2 = <?php echo (isset($ro_theme_name) && $ro_theme_name=='journal2') ? 'true' : 'false'; ?>;
                var ro_theme_name = "<?php echo $ro_theme_name; ?>";


                var option_prefix = "option";
                if ( ($('#mijoshop').length && $('[name^="option_oc["]').length) || ($('.com_jcart').length && $('[name^="option_oc["]').length) ) { //
                    option_prefix = "option_oc";
                }
                var option_prefix_length = option_prefix.length;

                <?php

                if (isset($options) && is_array($options)) {
                    foreach ($options as $option) {
                        echo "options_types[".$option['product_option_id']."]='".$option['type']."';\n";
                    }
                }

                if (isset($_GET['filter_name'])) {
                    echo "var filter_name=\"".$_GET['filter_name']."\";";
                } elseif (isset($_GET['search'])) {
                    echo "var filter_name=\"".$_GET['search']."\";";
                } else {
                    echo "var filter_name = false;";
                }

                if ( !isset($ro_array) || count($ro_array) == 0) {
                    echo "var ro_array = false;";
                } else {
                    echo "var ro_array = {};";
                    foreach ($ro_array as $relatedoptions_id => $relatedoptions_options) {
                        echo "ro_array[".$relatedoptions_id."] = {};\n";
                        foreach ($relatedoptions_options as $product_option_id => $product_option_value_id ) {
                            echo "ro_array[".$relatedoptions_id."][".$product_option_id."] = ".$product_option_value_id.";\n";
                        }
                    }
                }

                if ( !isset($ro_zero) || count($ro_zero) == 0) {
                    echo "var ro_zero = false;";
                } else {
                    echo "var ro_zero = {};";
                    foreach ($ro_zero as $relatedoptions_id => $relatedoptions_options) {
                        echo "ro_zero[".$relatedoptions_id."] = {};\n";
                        foreach ($relatedoptions_options as $product_option_id => $product_option_value_id ) {
                            echo "ro_zero[".$relatedoptions_id."][".$product_option_id."] = ".$product_option_value_id.";\n";
                        }
                    }
                }

                echo "ro_prices = {};\n";

                if (isset($ro_prices) && is_array($ro_prices)) {
                    foreach ($ro_prices as $relatedoptions_id => $ro_price) {

                        echo "ro_prices[".$relatedoptions_id."] = {};\n";
                        if (isset($ro_settings['spec_price']) && $ro_settings['spec_price']) {
                            echo "ro_prices[".$relatedoptions_id."]['price'] = ".$ro_price['price'].";\n";
                            if (isset($ro_price['discounts']) && is_array($ro_price['discounts']) ) {
                                echo "ro_prices[".$relatedoptions_id."]['discounts'] = [];\n";
                                foreach ($ro_price['discounts'] as $ro_discount)	{
                                    echo "ro_prices[".$relatedoptions_id."]['discounts'].push({quantity: ".$ro_discount['quantity'].", price: ".$ro_discount['price']."});\n";
                                }
                            } else {
                                echo "ro_prices[".$relatedoptions_id."]['discounts'] = false;\n";
                            }
                            if (isset($ro_price['specials']) && is_array($ro_price['specials']) ) {
                                echo "ro_prices[".$relatedoptions_id."]['specials'] = [];\n";
                                foreach ($ro_price['specials'] as $ro_special)	{
                                    echo "ro_prices[".$relatedoptions_id."]['specials'].push({price: ".$ro_special['price']."});\n";
                                }
                            } else {
                                echo "ro_prices[".$relatedoptions_id."]['specials'] = false;\n";
                            }
                        }

                        if (isset($ro_settings['spec_model']) && $ro_settings['spec_model']) {
                            echo "ro_prices[".$relatedoptions_id."]['model'] = \"".$ro_price['model']."\";\n";
                        }

                        if (isset($ro_settings['spec_ofs']) && $ro_settings['spec_ofs']) {
                            echo "ro_prices[".$relatedoptions_id."]['stock'] = \"".$ro_price['stock']."\";\n";
                            echo "ro_prices[".$relatedoptions_id."]['in_stock'] = \"".$ro_price['in_stock']."\";\n";
                        }

                    }
                }


                if (isset($ro_default)) {
                    if ($ro_default === FALSE) {
                        echo "var ro_default = false;\n";
                    } else {
                        echo "var ro_default = ".(int)$ro_default.";\n";
                    }
                }

                ?>

                var all_select_ov = {};
                $('select[name^="'+option_prefix+'["]').each( function (si, sel_elem) {
                    all_select_ov[sel_elem.name] = [];

                    $.each(sel_elem.options, function (oi, op_elem) {
                        all_select_ov[sel_elem.name].push(op_elem.value);
                    });

                } );

                (function ($) {
                    $.fn.toggleOption = function (value, show) {
                        /// <summary>Show or hide the desired option</summary>
                        return this.filter('select').each(function () {
                            var select = $(this);
                            if (typeof show === 'undefined') {
                                show = select.find('option[value="' + value + '"]').length == 0;
                            }
                            if (show) {
                                select.showOption(value);
                            }
                            else {
                                select.hideOption(value);
                            }
                        });
                    };
                    $.fn.showOption = function (value) {
                        /// <summary>Show the desired option in the location it was in when hideOption was first used</summary>
                        return this.filter('select').each(function () {
                            var select = $(this);
                            var found = select.find('option[value="' + value + '"]').length != 0;
                            if (found) return; // already there

                            var info = select.data('opt' + value);
                            if (!info) return; // abort... hideOption has not been used yet

                            var targetIndex = info.data('i');
                            var options = select.find('option');
                            var lastIndex = options.length - 1;
                            if (lastIndex == -1) {
                                select.prepend(info);
                            }
                            else {
                                options.each(function (i, e) {
                                    var opt = $(e);
                                    if (opt.data('i') > targetIndex) {
                                        opt.before(info);
                                        return false;
                                    }
                                    else if (i == lastIndex) {
                                        opt.after(info);
                                        return false;
                                    }
                                });
                            }
                            return;
                        });
                    };
                    $.fn.hideOption = function (value) {
                        /// <summary>Hide the desired option, but remember where it was to be able to put it back where it was</summary>
                        return this.filter('select').each(function () {
                            var select = $(this);
                            var opt = select.find('option[value="' + value + '"]').eq(0);
                            if (!opt.length) return;

                            if (!select.data('optionsModified')) {
                                // remember the order
                                select.find('option').each(function (i, e) {
                                    $(e).data('i', i);
                                });
                                select.data('optionsModified', true);
                            }

                            select.data('opt' + value, opt.detach());
                            return;
                        });
                    };
                })(jQuery);

                function get_main_price(main_price) {

                    if (ro_prices) {
                        ro_id = get_current_ro_id(get_options_values([]));
                        if (ro_id != -1 && (ro_id in ro_prices)) {
                            if (ro_prices[ro_id]['price'] != 0) {
                                return ro_prices[ro_id]['price'];
                            }
                        }
                    }
                    return main_price;
                }

                function stock_control(add_to_cart) {

                    <?php  if (!isset($ro_settings['stock_control']) || !$ro_settings['stock_control']) { ?>
                    if (add_to_cart) {
                        $('#buttonPhotoDay').attr('allow_add_to_cart','allow_add_to_cart');
                        $('#buttonPhotoDay').click();
                    }
                    return;
                    <?php } ?>

                    var erros_msg = '<?php echo $entry_stock_control_error; ?>';

                    var options_values = get_options_values([]);
                    var roid = get_current_ro_id(options_values);

                    $('.alert-warning, .alert-warning').remove();

                    if (roid!=-1) {

                        $.ajax({
                            url: '<?php echo HTTP_SERVER; ?>index.php?route=module/related_options/get_to_free_quantity&roid='+roid,
                            dataType : "text",                     // тип загружаемых данных
                            success: function (data) { // вешаем свой обработчик на функцию success
                                if (parseInt(data) < parseInt( $('input[type=text][name=quantity]').val() )) {
                                    $('.alert-warning, .alert-warning').remove();
                                    $('#input-quantity').parent().after('<div class="alert alert-warning">' + erros_msg.replace('%s',parseInt(data)) + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                                } else {
                                    if (add_to_cart) {
                                        $('#buttonPhotoDay').attr('allow_add_to_cart','allow_add_to_cart');
                                        $('#buttonPhotoDay').click();
                                    }
                                }
                            }
                        });
                    } else { // не определили связанную опцию - пусть срабатывает стандартный алгоритм
                        if (add_to_cart) {
                            $('#buttonPhotoDay').attr('allow_add_to_cart','allow_add_to_cart');
                            $('#buttonPhotoDay').click();
                        }

                    }

                }

                function get_current_ro_id(options_values) {
                    var all_ok;
                    for(var ro_key in ro_array) {
                        if((ro_array[ro_key] instanceof Function) ) { continue; }
                        all_ok = true;
                        for(var ov_key in ro_array[ro_key]) {
                            if((ro_array[ro_key][ov_key] instanceof Function) ) { continue; }
                            if (!(ov_key in options_values && options_values[ov_key]==ro_array[ro_key][ov_key])) {
                                all_ok = false;
                            }
                        }
                        if (all_ok) return ro_key;
                    }
                    return -1;
                }


                function option_values_access(options_values, option_id) {
                    accessible_values = [];

                    for(var ro_key in ro_array) {
                        if((ro_array[ro_key] instanceof Function) ) { continue; }
                        all_ok = true;
                        for(var ov_key in options_values) {
                            if((ro_array[ro_key][ov_key] instanceof Function) ) { continue; }
                            if (ov_key != option_id) {
                                if (options_values[ov_key]) {
                                    if (ro_array[ro_key][ov_key] != options_values[ov_key]) {
                                        all_ok = false;
                                    }
                                }
                            }
                        }

                        if (all_ok &&  ($.inArray(ro_array[ro_key][option_id], accessible_values) == -1 )) accessible_values.push(ro_array[ro_key][option_id]);

                    }

                    set_accessible_values(option_id, accessible_values);

                }

                function ro_toggle_option_block(option_id, toggle_flag) {

                    <?php if ( substr($ro_theme_name, 0, 6) == 'carera' ) { ?>
                    $('#option-'+option_id).toggle(toggle_flag);
                    <?php } else { ?>
                    $('#input-option'+option_id).parent().toggle(toggle_flag);
                    <?php } ?>

                }

                function ro_option_is_available(option_id) {

                    if ($('select[name="'+option_prefix+'['+option_id+']"]').length) {
                        return $('select[name="'+option_prefix+'['+option_id+']"] option[value][value!=""]:not(:disabled)').length ? true : false;
                    } else if ($('input[type=radio][name="'+option_prefix+'['+option_id+']"]').length) {
                        return $('input[type=radio][name="'+option_prefix+'['+option_id+']"]:not(:disabled)').length ? true : false;
                    }

                }

                function ro_hide_unavailable_option(option_id) {

                    if (ro_settings && ro_settings['hide_option']) {
                        ro_toggle_option_block(option_id, ro_option_is_available(option_id));
                    }
                }

                function ro_unavailable_options_not_required(option_id) {

                    if (ro_settings && ro_settings['unavailable_not_required']) {
                        var current_ids = [];
                        if ($('#ro_not_required').length) {
                            current_ids = $('#ro_not_required').val().split(',');
                        } else {
                            $('#product').append('<input type="hidden" name="ro_not_required" id="ro_not_required" value="">');
                        }
                        var new_ids = [];
                        for (var i in current_ids) {
                            if (current_ids[i] != option_id) {
                                new_ids.push(current_ids[i]);
                            }
                        }
                        if (!ro_option_is_available(option_id)) {
                            new_ids.push(option_id);
                        }
                        $('#ro_not_required').val( new_ids.toString());
                    }

                }

                function set_accessible_values(option_id, accessible_values) {

                    var current_value = ($('input[type=radio][name="'+option_prefix+'['+option_id+']"]:checked').val() || $('select[name="'+option_prefix+'['+option_id+']"]').val());

                    if ($('select[name="'+option_prefix+'['+option_id+']"]').length) {

                        if (current_value && $.inArray(parseInt(current_value), accessible_values)==-1) {
                            $('select[name="'+option_prefix+'['+option_id+']"]').val('');
                            $('select[name="'+option_prefix+'['+option_id+']"]').change();
                        }

                        if (hide_inaccessible) {

                            select_options = all_select_ov[option_prefix+"["+option_id+"]"];
                            for (var i=0;i<select_options.length;i++) {
                                if (select_options[i]) {
                                    option_value_disabled = ($.inArray(parseInt(select_options[i]),accessible_values) == -1);
                                    // hiding options for IE
                                    $('select[name="'+option_prefix+'['+option_id+']"]').toggleOption(parseInt(select_options[i]), !option_value_disabled);

                                    // Product Color Option
                                    var elem_pco = $('.color-option[optval="'+select_options[i]+'"]');
                                    if ( elem_pco.length ) {
                                        if ( option_value_disabled ) {  // toggle and show/hide may break style
                                            elem_pco.css('display','none');
                                        } else {
                                            elem_pco.css('display','');
                                        }
                                        elem_pco.attr('disabled', option_value_disabled);
                                        if (option_value_disabled && elem_pco.hasClass('color-active')) {
                                            elem_pco.removeClass('color-active');
                                            $('#'+elem_pco.attr('option-text-id')).html('');
                                        }
                                    }
                                }
                            }

                        } else {

                            select_options = $('select[name="'+option_prefix+'['+option_id+']"]')[0].options;
                            for (var i=0;i<select_options.length;i++) {

                                if (select_options[i].value) {

                                    option_value_disabled = ($.inArray(parseInt(select_options[i].value),accessible_values) == -1);
                                    select_options[i].disabled = option_value_disabled;
                                    if (option_value_disabled) {
                                        $(select_options[i]).addClass('ro_option_disabled');
                                    } else {
                                        $(select_options[i]).removeClass('ro_option_disabled');
                                    }

                                    // Product Color Option
                                    var elem_pco = $('.color-option[optval="'+$(select_options[i]).val()+'"]');
                                    if ( elem_pco.length ) {
                                        elem_pco.attr('disabled', option_value_disabled);
                                        elem_pco.fadeTo("fast", (option_value_disabled ? 0.2 : 1) );
                                        if (option_value_disabled && elem_pco.hasClass('color-active')) {
                                            elem_pco.removeClass('color-active');
                                            $('#'+elem_pco.attr('option-text-id')).html('');
                                        }
                                    }

                                }

                            }

                        }

                        if ( ro_theme_name == 'theme638' ) { // VIVA theme
                            $('select[name="'+option_prefix+'['+option_id+']"]').selectbox("detach");

                            $('select[name="'+option_prefix+'['+option_id+']"]').selectbox({
                                effect: "slide",
                                speed: 400
                            });

                        }

                        if ( $('select[name="option['+option_id+']"]').next('div.bootstrap-select').length ) {
                            // bootstrap selects
                            $('select[name="'+option_prefix+'['+option_id+']"]').data('selectpicker').refresh(); // bt_claudine theme compatibility
                        }

                    } else if ($('input[type=radio][name="'+option_prefix+'['+option_id+']"]').length) {

                        if (current_value && $.inArray(parseInt(current_value), accessible_values)==-1) {

                            $('input[type=radio][name="'+option_prefix+'['+option_id+']"]:checked').prop('checked', false);
                            $('input[type=radio][name="'+option_prefix+'['+option_id+']"]:checked').change();


                            // << Product Image Option DropDown compatibility
                            var piodd_option_div = $('#image-option-'+option_id);
                            if (piodd_option_div.length) {
                                ro_piodd_set_value(option_id, '');
                            }
                            // >> Product Image Option DropDown compatibility
                        }

                        radio_options = $('input[type=radio][name="'+option_prefix+'['+option_id+']"]');
                        for (var i=0;i<radio_options.length;i++) {
                            option_value_disabled = ($.inArray(parseInt(radio_options[i].value),accessible_values) == -1);
                            $(radio_options[i]).attr('disabled', option_value_disabled);

                            if (hide_inaccessible) {

                                // carera theme specific
                                <?php if ( substr($ro_theme_name, 0, 6) == 'carera' ) { ?>

                                $(radio_options[i]).toggle(!option_value_disabled);
                                $('label[for="'+$(radio_options[i]).attr('id')+'"]').toggle(!option_value_disabled);
                                if ( $('label[for="'+$(radio_options[i]).attr('id')+'"]').next().is('br') ) {
                                    $('label[for="'+$(radio_options[i]).attr('id')+'"]').next().toggle(!option_value_disabled);
                                }

                                <?php } else { ?>

                                if ( ro_theme_name == 'pavilion' && $(radio_options[i]).parent().is('label') ) { // pavilion (compatible with buttons)
                                    $(radio_options[i]).parent().toggle(!option_value_disabled);
                                } else {
                                    $(radio_options[i]).parent().parent().toggle(!option_value_disabled);
                                    $(radio_options[i]).toggle(!option_value_disabled);
                                }

                                // надо менять стиль для изменения отступов
                                if (option_value_disabled) {
                                    if ($(radio_options[i]).parent().parent().hasClass('radio')) {
                                        $(radio_options[i]).parent().parent().removeClass('radio');
                                        $(radio_options[i]).parent().parent().addClass('radio_ro');
                                    }
                                } else {
                                    if ($(radio_options[i]).parent().parent().hasClass('radio_ro')) {
                                        $(radio_options[i]).parent().parent().removeClass('radio_ro');
                                        $(radio_options[i]).parent().parent().addClass('radio');
                                    }
                                }
                                <?php } ?>

                                // << Product Image Option DropDown compatibility
                                var piodd_option_div = $('#image-option-'+option_id);
                                var piodd_value = piodd_option_div.find('ul.dd-options input.dd-option-value[value='+radio_options[i].value+']');
                                if (piodd_value.length) {
                                    piodd_value.parent().toggle(!option_value_disabled);
                                }
                                // >> Product Image Option DropDown compatibility

                            } else {


                                if (option_value_disabled) {
                                    $(radio_options[i]).parent().fadeTo("fast", 0.2);
                                } else {
                                    $(radio_options[i]).parent().fadeTo("fast", 1);
                                }

                                // << Product Image Option DropDown compatibility
                                // делаем клоны недоступных вариантов, оригиналы временно прячем в скрытый див. потом если они становятся доступными - возвращаем.
                                var piodd_option_div = $('#image-option-'+option_id);

                                if ( piodd_option_div.find('ul.dd-options').length ) {

                                    var ro_hidden_div_id = piodd_option_div.attr('id')+'-ro-hidden';

                                    if ( !$('#'+ro_hidden_div_id).length ) {
                                        piodd_option_div.after('<div id="'+ro_hidden_div_id+'" style="display: none;"></div>');
                                    }
                                    var ro_hidden_div = $('#'+ro_hidden_div_id);


                                    var clone_id = 'clone_'+radio_options[i].value;
                                    if (option_value_disabled) {

                                        var piodd_value = piodd_option_div.find('ul.dd-options input.dd-option-value[value='+radio_options[i].value+']');

                                        if (piodd_value.length) {

                                            if ( !piodd_option_div.find('[clone_id='+clone_id+']').length ) {
                                                var ro_clone = piodd_value.parent().clone(true, true).appendTo(ro_hidden_div);
                                                ro_clone.clone().insertAfter(piodd_value.parent()).attr('clone_id', clone_id).fadeTo('fast', 0.2);
                                                piodd_value.parent().remove();
                                            }
                                        }

                                    } else {
                                        if (ro_hidden_div.find('[value='+radio_options[i].value+']').length) {
                                            ro_hidden_div.find('[value='+radio_options[i].value+']').parent().clone(true, true).insertAfter(piodd_option_div.find('[clone_id='+clone_id+']'));
                                            ro_hidden_div.find('[value='+radio_options[i].value+']').parent().remove();
                                            piodd_option_div.find('[clone_id='+clone_id+']').remove();
                                        }
                                    }

                                }
                                // >> Product Image Option DropDown compatibility

                            }
                        }

                    }

                    ro_hide_unavailable_option(option_id);
                    ro_unavailable_options_not_required(option_id);

                }

                function get_options_values(options_keys) {

                    var options_values = {};

                    $('select[name^="'+option_prefix+'["], input[type=radio][name^="'+option_prefix+'["]').each(function(){
                        option_id = ro_get_product_option_id_from_name( $(this).attr('name') );

                        if (option_id && !isNaN(option_id)) option_id = parseInt(option_id);

                        if ($.inArray(option_id,variant_product_options) != -1) {

                            if ($.inArray(option_id,options_keys) == -1) {
                                options_values[option_id] = 0;
                                options_keys.push(option_id);
                            }

                            if ( $(this).find('option[value]').length ) { // select
                                options_values[option_id] = $(this).val();
                            } else { // radio
                                if ( $(this).is(':checked') ) {
                                    options_values[option_id] = $(this).val();
                                }
                            }


                        }
                    });

                    return options_values;


                }

                // автовыбор корректных начальных значений опций, если уже выбраны какие-то значения
                function use_first_values(set_anyway) {

                    var options_values = get_options_values([]);

                    var has_selected = false;
                    for (var optkey in options_values) {
                        if((options_values[optkey] instanceof Function) ) { continue; }
                        if (options_values[optkey]) {
                            has_selected = true;
                            break;
                        }
                    }

                    if ((has_selected || set_anyway) && ro_array && Object.keys(ro_array).length > 0) {
                        ro_key = Object.keys(ro_array)[0];
                        setSelectedRO(ro_key);
                    }

                }

                function setSelectedRO(ro_key) {

                    if (ro_array && ro_array[ro_key]) {

                        var last_opt_id = "";
                        for (var opt_id in ro_array[ro_key]) {
                            if((ro_array[ro_key][opt_id] instanceof Function) ) { continue; }

                            if ($('select[name="'+option_prefix+'['+opt_id+']"]').length > 0) {
                                $('[name="'+option_prefix+'['+opt_id+']"]').val(ro_array[ro_key][opt_id]);

                            } else if ($('input[type=radio][name="'+option_prefix+'['+opt_id+']"]').length > 0) {

                                $('input[type=radio][name="'+option_prefix+'['+opt_id+']"][value='+ro_array[ro_key][opt_id]+']').prop('checked', true);

                                // boss themes comohos
                                $('input[type=radio][name="'+option_prefix+'['+opt_id+']"][value='+ro_array[ro_key][opt_id]+']').parents('.bt-image-option').addClass('active');

                                //$('input[type=radio][name="'+option_prefix+'['+opt_id+']"][value='+ro_array[ro_key][opt_id]+']').prop('checked', true);

                                // << Product Image Option DropDown compatibility
                                ro_piodd_set_value(opt_id, ro_array[ro_key][opt_id]);
                                // >> Product Image Option DropDown compatibility

                            }

                            last_opt_id = opt_id;

                        }

                        if (last_opt_id != "") {
                            if ($('select[name="'+option_prefix+'['+last_opt_id+']"]').length > 0) {
                                $('[name="'+option_prefix+'['+last_opt_id+']"]').change();
                            } else if ($('input[type=radio][name="'+option_prefix+'['+last_opt_id+']"]').length > 0) {
                                $('input[type=radio][name="'+option_prefix+'['+last_opt_id+']"][value='+ro_array[ro_key][last_opt_id]+']').change();
                            }
                        }

                    }

                    //set_block_options();
                    set_journal2_options();

                    // POIP change images
                    if ( typeof(poip_option_value_selected) == 'function' && typeof(poip_product_option_ids) != 'undefined' && poip_product_option_ids.length ) {
                        var poip_product_option_id = poip_product_option_ids[0];
                        if ( $('select[name="'+option_prefix+'['+poip_product_option_ids+']"]').length ) {
                            poip_option_value_selected( $('select[name="'+option_prefix+'['+poip_product_option_ids+']"]')[0] );
                        } else if ( $('input[name="'+option_prefix+'['+poip_product_option_ids+']"]:first').length ) {
                            poip_option_value_selected( $('input[name="'+option_prefix+'['+poip_product_option_ids+']"]:first')[0] );
                        }
                    }

                }

                function ro_get_product_option_id_from_name(name) {
                    return name.substr(option_prefix_length+1, name.indexOf(']')-(option_prefix_length+1) )
                }

                // для пошагового варианта
                function get_options_steps() {
                    var options_steps = [];
                    var product_option_id = "";

                    for (var i=0;i<$('[name^="'+option_prefix+'["]').length;i++) {

                        product_option_id = ro_get_product_option_id_from_name($('[name^="'+option_prefix+'["]')[i].name);

                        if (!isNaN(product_option_id)) product_option_id = parseInt(product_option_id);
                        if ($.inArray(product_option_id, variant_product_options) != -1) {
                            if ($.inArray(product_option_id, options_steps) == -1) {
                                options_steps.push(product_option_id);
                            }
                        }
                    }

                    return options_steps;
                }

                function options_values_access() {

                    if (!ro_array) return;

                    if (ro_step_by_step) {

                        var options_steps = get_options_steps();
                        var prev_options_values = {};
                        var prev_options = [];

                        for (var i=0;i<options_steps.length;i++) {

                            if (i>0) {
                                if (prev_options[i-1]) {

                                    // ограничения по предыдущим
                                    option_values_access(prev_options_values, options_steps[i]);

                                } else {

                                    // откл все
                                    set_accessible_values(options_steps[i], []);
                                }
                            }
                            prev_options.push( ($('input[type=radio][name="'+option_prefix+'['+options_steps[i]+']"]:checked').val() || $('select[name="'+option_prefix+'['+options_steps[i]+']"]').val()) );
                            prev_options_values[options_steps[i]] = prev_options[prev_options.length-1];
                        }

                    } else {

                        var options_keys = [];
                        var options_values = get_options_values(options_keys);
                        for (var i=0;i<options_keys.length;i++) {
                            option_values_access(options_values, options_keys[i]);
                        }

                    }

                    stock_control(0);


                    check_block_options();

                    check_auto_select();

                    <?php if (isset($ro_settings['spec_model']) && $ro_settings['spec_model']) { ?>
                    set_model();
                    <?php } ?>

                    <?php if (isset($ro_settings['spec_ofs']) && $ro_settings['spec_ofs']) { ?>
                    set_stock();
                    <?php } ?>

                }

                // автовыбор безвариантных значений опций
                function check_auto_select() {

                    if (auto_select_last) {

                        var select_names = [];
                        $('select[name^="'+option_prefix+'"]').each(function (i) {
                            if ($(this).attr('name') && $.inArray($(this).attr('name'), select_names)==-1 ) {
                                select_names.push($(this).attr('name'));
                            }
                        });

                        for (var i=0; i<select_names.length; i++) {
                            var option_selects = $('select[name="'+select_names[i]+'"]').find('option:not([value=""]):not([disabled])');
                            if ( option_selects.length == 1 && !$(option_selects[0]).prop('selected') ) {

                                var opt_val = $(option_selects[0]).attr('value');

                                $('select[name="'+select_names[i]+'"]').val(opt_val);

                                $('select[name="'+select_names[i]+'"]').trigger('change');

                                // << Journal2 compatibility
                                if (use_journal2 && $('li[data-value="'+opt_val+'"]').length) {
                                    $(option_selects[0]).parent().parent().find('li[data-value]').removeClass('selected');
                                    $('#product li[data-value="'+opt_val+'"]').removeClass('selected').addClass('selected');
                                    //$('li[data-value="'+opt_val+'"]').trigger('click');
                                }
                                // >> Journal2 compatibility

                                return;
                            }
                        }

                        var radio_names = [];
                        $('input[type=radio][name^="'+option_prefix+'"]').each(function (i) {
                            if ($(this).attr('name') && $.inArray($(this).attr('name'), radio_names)==-1 ) {
                                radio_names.push($(this).attr('name'));
                            }
                        });
                        for (var i=0; i<radio_names.length; i++) {
                            var option_radios = $('input[type=radio][name="'+radio_names[i]+'"]:visible:not([disabled])');
                            if ( option_radios.length == 1 && !$(option_radios[0]).prop('checked') ) {
                                $(option_radios[0]).prop('checked', true);

                                var opt_val = option_radios.val();

                                // << Journal2 compatibility
                                if ($('li[data-value="'+opt_val+'"]').length) {
                                    $(option_radios[0]).parent().find('li[data-value]').removeClass('selected');
                                    $('#product li[data-value="'+opt_val+'"]').removeClass('selected').addClass('selected');
                                    //$('li[data-value="'+opt_val+'"]').trigger('click');
                                }
                                // >> Journal2 compatibility

                                // << Product Image Option DropDown compatibility
                                var product_option_id = option_radios.attr('name').substr(7).replace(']', '');
                                ro_piodd_set_value(product_option_id, opt_val);
                                // >> Product Image Option DropDown compatibility

                                $(option_radios[0]).trigger('change');
                                return;
                            }
                        }

                    }

                }

                function set_model() {

                    var options_values = get_options_values([]);
                    var roid = get_current_ro_id(options_values);

                    if (roid!=-1 && ro_prices[roid]['model']!='') {
                        var model = ro_prices[roid]['model'];
                    } else {
                        var model = "<?php echo htmlspecialchars($model); ?>";
                    }

                    $('#product_model').html(model);
                }

                function set_stock() {
                    var stock_text = "<?php echo htmlspecialchars($text_stock); ?>";
                    var options_values = get_options_values([]);
                    var roid = get_current_ro_id(options_values);

                    if (roid!=-1 && ro_prices[roid]['stock']!='') {
                        var stock = ro_prices[roid]['stock'];

                        if (use_journal2) {
                            var journal2_stock_status = ro_prices[roid]['in_stock'] ? 'instock' : 'outofstock';
                        }
                    } else {
                        var stock = "<?php echo htmlspecialchars($stock); ?>";
                        if (use_journal2) {
                            var journal2_stock_status = "<?php echo isset($stock_status) ? $stock_status : ''; ?>";
                        }
                    }

                    if (use_journal2) {
                        //journal2 uses specific price and stock update, but it's slow and doesn't swith block class (style)
                        $('#product .p-stock .journal-stock').removeClass('instock, outofstock').addClass(journal2_stock_status);
                        $('#product .p-stock .journal-stock').html(stock);
                    } else {

                        if (ro_theme_name == 'coloring') {
                            $('#product_stock').html('<strong>'+stock+'</strong>');
                            if (roid!=-1) {

                                $('#product_stock').removeClass('alert-danger').removeClass('alert-success');

                                if ( ro_prices[roid]['in_stock'] ) {
                                    $('#product_stock').addClass('alert-success');
                                } else {
                                    $('#product_stock').addClass('alert-danger');
                                }
                            }
                        } else {
                            $('#product_stock').html(stock);
                        }
                    }


                }

                function setRObyModel(model) {
                    if (model && ro_array && ro_prices) {

                        for (var ro_key in ro_prices) {
                            if((ro_prices[ro_key] instanceof Function) ) { continue; }
                            if (ro_prices[ro_key]['model'] && ro_prices[ro_key]['model'] != '') {
                                if (model.toLowerCase() == ro_prices[ro_key]['model'].toLowerCase()) {
                                    setSelectedRO(ro_key);
                                    return true;
                                }
                            }
                        }
                    }
                    return false;
                }

                // Block Option & journal2 compatibility
                function check_block_options() {

                    if (use_block_options || use_journal2) {

                        var available_values = [];

                        // block options use SELECTs for select & radio
                        $('select[name^="'+option_prefix+'["]').find('option').each( function () {

                            if ($(this).val()) {
                                if (hide_inaccessible) {
                                    available_values.push( $(this).val() );
                                } else {
                                    if (! $(this).attr('disabled')) {
                                        available_values.push( $(this).val() );
                                    }
                                }
                            }

                        });

                        // block options use RADIOs for images
                        $('input[type=radio][name^="'+option_prefix+'["]').each( function () {

                            if (hide_inaccessible) {
                                if ($(this)[0].style.display != 'none') {
                                    available_values.push( $(this).val() );
                                }
                            }

                        });

                        // Product Block Option Module
                        if (use_block_options) {
                            $('a[id^=block-option],a[id^=block-image-option]').each( function () {
                                if ($.inArray($(this).attr('option-value'), available_values) == -1) {
                                    $(this).removeClass('block-active');
                                    if (hide_inaccessible) {
                                        $(this).hide();
                                    } else {
                                        if (!$(this).attr('disabled')) {
                                            $(this).attr('disabled', true);
                                            $(this).fadeTo("fast", 0.2);
                                        }
                                    }
                                } else {
                                    if (hide_inaccessible) {
                                        $(this).show();
                                    } else {
                                        if ($(this).attr('disabled')) {
                                            $(this).attr('disabled', false);
                                            $(this).fadeTo("fast", 1);
                                        }
                                    }
                                }

                            } );
                        }

                        // Journal2
                        if (use_journal2) {

                            $('#product').find('li[data-value]').each(function() {

                                if ($.inArray($(this).attr('data-value'), available_values) == -1) {
                                    $(this).removeClass('selected');
                                    if (hide_inaccessible) {
                                        $(this).hide();
                                    } else {
                                        if (!$(this).attr('disabled')) {
                                            $(this).attr('disabled', true);
                                            $(this).fadeTo("fast", 0.2);
                                        }
                                    }
                                } else {
                                    if (hide_inaccessible) {
                                        $(this).show();
                                    } else {
                                        if ($(this).attr('disabled')) {
                                            $(this).attr('disabled', false);
                                            $(this).fadeTo("fast", 1);
                                        }
                                    }
                                }

                                // change standart Journal2 function
                                $(this).unbind('click');


                                $(this).click(function () {
                                    if ($(this).attr('disabled')) {
                                        return;
                                    }
                                    $(this).siblings().removeClass('selected');
                                    $(this).addClass('selected');
                                    $(this).parent().siblings('select').find('option[value=' + $(this).attr('data-value') + ']').attr('selected', 'selected');
                                    $(this).parent().siblings('select').trigger('change');

                                    $(this).parent().parent().find('.radio input[type=radio][name^="'+option_prefix+'"]').attr('checked', false);
                                    $(this).parent().parent().find('.radio input[type=radio][name^="'+option_prefix+'"][value='+$(this).attr('data-value')+']').attr('checked', true).trigger('change');

                                    if (Journal.updatePrice) {
                                        Journal.updateProductPrice();
                                    }

                                });


                            });

                        }

                    }

                }

                // Journal2 compatibility
                function set_journal2_options() {

                    if (use_journal2) {
                        $('select[name^="'+option_prefix+'["]').find('option').each( function () {
                            var poid = $(this).parent().attr('name').substr(7, $(this).parent().attr('name').length-8);

                            // выключаем все блоки для SELECT
                            //$(this).parent().parent().find('li[data-value]').removeClass('selected');

                            if ($(this).parent().val()) {
                                $(this).parent().parent().find('li[data-value='+$(this).parent().val()+']').removeClass('selected').addClass('selected');
                            } else {
                                $(this).parent().parent().find('li[data-value]').removeClass('selected');
                            }

                        });

                        // block options use RADIOs for images
                        $('input[type=radio][name^="'+option_prefix+'["]').each( function () {
                            var poid = $(this).attr('name').substr(7, $(this).attr('name').length-8);

                            // выключаем только текущий блок для RADIO
                            //$(this).parent().find('li[data-value]').removeClass('selected');

                            if ($(this).is(':checked')) {

                                $('#input-option'+poid).parent().find('li[data-value='+$(this).val()+']').removeClass('selected').addClass('selected');
                            } else {

                                $('#input-option'+poid).parent().find('li[data-value]').removeClass('selected');
                            }

                        });

                    }

                }



                $('select[name^="'+option_prefix+'"]').change(function(){
                    options_values_access();
                })

                $('input[type=radio][name^="'+option_prefix+'"]').change(function(){
                    options_values_access();
                })

                $("input[type=text][name=quantity]").change(function(){
                    stock_control(0);
                })


                //options_values_access();

                $(document).ready( function() {
                    // если задан фильтр и он совпадает с моделью из связанных опций - должно быть выбрано именно это сочетание
                    if (!setRObyModel(filter_name)) { // нет по фильтру, или нет самого фильтра, тогда...
                        // если при открытии выбрана опция - надо перевыбрать доступное сочетание
                        if (ro_default !== false) {
                            setSelectedRO(ro_default);
                        } else {
                            <?php if (!isset($poip_ov)) { ?>
                            setTimeout(function () { use_first_values(); }, 1); // если какое-то сочетание уже выбрано (возможно другим модулем), проверим и если такого нет в связанных опциях - сменим
                            <?php } ?>
                        }
                    }

                    options_values_access();

                });

                <?php

                if (isset($ro_settings) && isset($ro_settings['show_clear_options']) && $ro_settings['show_clear_options'] && isset($ro_array) && $ro_array ) {
                if ((int)$ro_settings['show_clear_options'] == 1) { ?>
                $(document).ready( function() {
                    $('#product').find('h3').after('<div class="form-group"><a href="#" id="clear_options"><?php echo $text_ro_clear_options; ?></a></div>');
                });
                <?php } else { ?>
                $(document).ready( function() {
                    <?php if ($ro_theme_name=='journal2') { ?>
                    $('#product .options').append('<div class="form-group"><a href="#" id="clear_options" ><?php echo $text_ro_clear_options; ?></a></div>');
                    //$('#product').find('h3:first').parent().append('<div class="form-group"><a href="#" id="clear_options" ><?php echo $text_ro_clear_options; ?></a></div>');
                    <?php } else { ?>
                    $('#product #input-quantity').parent().before('<div class="form-group"><a href="#" id="clear_options"><?php echo $text_ro_clear_options; ?></a></div>');
                    <?php } ?>
                });
                <?php } ?>

                $('#product').on('click', '#clear_options', function(e){
                    e.preventDefault();
                    clear_options();
                });

                <?php
                }
                ?>

                if (use_journal2) { // compatibility for live price update with specials in related options

                    var div_prod_opt = $('div.product-options');

                    if (div_prod_opt.length == 1) {
                        if ( div_prod_opt.find('div.price').find('span.product-price').length ) {
                            div_prod_opt.find('div.price').find('span.product-price').after('<span class="price-old" style="display: none"></span><span class="price-new" style="display: none"></span>');

                        } else if ($('div.price').find('span.price-old').length) {
                            div_prod_opt.find('div.price').find('span.price-old').before('<span class="product-price" itemprop="price" style="display: none"></span>');
                        }

                        setInterval( function() {

                            if ( div_prod_opt.find('div.price').find('span.product-price').html() && div_prod_opt.find('div.price').find('span.price-old').html() && div_prod_opt.find('div.price').find('span.price-new').html() ) {

                                if ( div_prod_opt.find('div.price').find('span.price-old').html() == div_prod_opt.find('div.price').find('span.price-new').html()
                                    || Number($('div.product-options').find('div.price').find('span.price-new').html().replace(/\D/g, '')) == 0 ) {
                                    div_prod_opt.find('div.price').find('span.price-old').hide();
                                    div_prod_opt.find('div.price').find('span.price-new').hide();
                                    div_prod_opt.find('div.price').find('span.product-price').show();
                                } else {
                                    div_prod_opt.find('div.price').find('span.price-old').show();
                                    div_prod_opt.find('div.price').find('span.price-new').show();
                                    div_prod_opt.find('div.price').find('span.product-price').hide();
                                }
                            }
                        }, 200 );

                    }

                }

            </script>
            <?php

        }

        ?>
    <?php } ?>
    <!-- >> Related Options / Связанные опции -->
<?php echo $footer; ?>