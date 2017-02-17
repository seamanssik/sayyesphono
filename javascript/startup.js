const _body = $('body');

// retinajs();

jQuery.fn.exist = function() {
    var exist;
    this.length >= 1 ? exist = true : exist = false;
    return exist;
};

$(function() {
    $.datetimepicker.setLocale('ru');

    $('input[name="telephone"]').mask("+38(099)999-99-99",{placeholder:"+38(0__)___-__-__"});

    jcf.setOptions('Select', {
        wrapNative: false,
        wrapNativeOnMobile: true,
        useCustomScroll: true,
        fakeDropInBody: false
    });

    jcf.replaceAll();
});

// Form validator add new method
$.validator.addMethod("nonNumeric", function (value, element) {
    return this.optional(element) || !isNaN(Number(value));
}, "Only alphabatic characters allowed.");

$.validator.addMethod("notNumber", function (value, element) {
    var reg = /[0-9]/;
    return !reg.test(value);
}, "Number is not permitted");

$.validator.methods.email = function (value, element) {
    return this.optional(element) || /[-a-zA-Z0-9]+@[-a-zA-Z0-9]+\.[a-z]+/.test(value);
};

$(document).on('click', '.photoday-scroll', function (e) {
    $('html, body').animate({ scrollTop: _body.find('.photoday-order').first().offset().top - 30 }, 'slow');

    e.preventDefault();
});


/**
 * Archive photodays page
 */
$(window).load(function () {
    var _element = _body.find('.photodays-images');

    if ( _element.exist() ) {
        _element.masonry({
            itemSelector: 'a',
            columnWidth: 1
        });

        _element.magnificPopup({
            type: 'image',
            delegate: 'a',
            gallery: {
                enabled:true
            }
        });
    }

    var _photodayImages = _body.find('#photodayImages');
    if ( _photodayImages.exist() ) {
        _photodayImages.magnificPopup({
            type: 'image',
            delegate: 'a',
            gallery: {
                enabled:true
            }
        });
    }
});


/**
 * Shoowroom page
 */
$(document).ready(function () {
    var _product = _body.find('#product');

    if ( _product.exist() ) {
        var container = _product.find('#price-buy'),
            _buy_price = container.attr('data-new-price');

        var price = parseInt(container.attr('data-price'));

        if (container.attr('data-prefix') == '+') {
            price += parseInt(_buy_price);
        }
        if (container.attr('data-prefix') == '-') {
            price -= parseInt(_buy_price);
        }

        container.text(price);

        _product.find('.showroom-images').magnificPopup({
            type: 'image',
            delegate: 'a',
            gallery: {
                enabled:true
            }
        });
    }

    $(document).on('click', '#button-cart', function () {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            success: function (json) {
                if (json['success']) {
                    _body.find('#modalSuccess .modalSuccess-text').html(json['success']);
                    _body.find('#modalSuccess').modal('show');
                }
            }
        });
    });
});

$(document).ready(function () {
    if (is.desktop()) {
        //Check to see if the window is top if not then display button
        $(window).scroll(function(){
            if ($(this).scrollTop() > 100) {
                $('.scrollToTop').fadeIn();
            } else {
                $('.scrollToTop').fadeOut();
            }
        });

        // Click event to scroll to top
        $('.scrollToTop').click(function () {
            $('html, body').animate({scrollTop: 0}, 800);
            return false;
        });
    }

    if (_body.hasClass('account-address-edit') || _body.hasClass('account-register')) {
        $('select[name=\'country_id\']').on('change', function() {
            $.ajax({
                url: 'index.php?route=account/account/country&country_id=' + this.value,
                dataType: 'json',
                beforeSend: function() {
                    $('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
                },
                complete: function() {
                    $('.fa-spin').remove();
                },
                success: function(json) {
                    html = '<option value=""> --- Выберите --- </option>';

                    if (json['zone'] && json['zone'] != '') {
                        for (i = 0; i < json['zone'].length; i++) {
                            html += '<option value="' + json['zone'][i]['zone_id'] + '"';

                            if (json['zone'][i]['zone_id'] == _body.find('input[name="current_zone_id"]').val()) {
                                html += ' selected="selected"';
                            }

                            html += '>' + json['zone'][i]['name'] + '</option>';
                        }
                    } else {
                        html += '<option value="0" selected="selected"> --- Не выбрано --- </option>';
                    }

                    $('select[name=\'zone_id\']').html(html);
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });

        $('select[name=\'country_id\']').trigger('change');
    }
});

function getURLVar(key) {
    var value = [];

    var query = String(document.location).split('?');

    if (query[1]) {
        var part = query[1].split('&');

        for (i = 0; i < part.length; i++) {
            var data = part[i].split('=');

            if (data[0] && data[1]) {
                value[data[0]] = data[1];
            }
        }

        if (value[key]) {
            return value[key];
        } else {
            return '';
        }
    }
}


/**
 * Exist function's
 */
$(function () {
    var $element = $(".page.contact");
    if ( $element.exist() ) {

    }
});


/**
 * Get offset.top elemt of scroll
 */
function scrollContent() {
    var totalScroll = $(document).height() - $(window).height();

    // Get Scroll Value
    if(is.desktop()){
        newScroll = $(window).scrollTop();
    } else {
        newScroll = $('body').scrollTop();
    }

    currentScroll = newScroll;

    /* To-load
     ================================================== */
    $('.js-animate').each(function(){
        var object = $(this);

        if(newScroll + $(window).height() * 0.85 > $(this).offset().top){
            object.removeClass('-no-anim');
            object.addClass('is-animated');
        } else if(newScroll + $(window).height() < $(this).offset().top) {
            object.addClass('-no-anim');
            object.removeClass('is-animated');
        }

    });
}

$(window).scroll(function(){
    scrollContent();
});

$(document).on('click', '#loadReviews', function () {
    alert('load more Reviews');
});


/**
 * Show aside menu
 */
$(document).on('click', '#showAside, #showBackdrop, #showClose', function () {
    _body.toggleClass('aside-show');
    _body.find('.aside').toggleClass('show');
});

$(document).ready(function () {
    _body.addClass('is-ready');

    scrollContent();

    /**
     * Init Slide Show
     */
    var _slideShow = _body.find('#homeSlideShow');
    if ( _slideShow.exist() ) {
        _slideShow.owlCarousel({
            items: 1,
            autoPlay: 20000,
            singleItem: true,
            navigation: true,
            pagination: true,
            lazyLoad: true,
            touchDrag: false,
            mouseDrag: false,
            addClassActive: true,
            transitionStyle: 'fade'
        });
    }

    /**
     * Init photoday Studio Slide Show
     */
    var _photodayStudio = _body.find('#photodayStudio');
    if ( _photodayStudio.exist() ) {
        _photodayStudio.owlCarousel({
            items: 1,
            autoPlay: 20000,
            singleItem: true,
            navigation: true,
            pagination: true,
            lazyLoad: true,
            touchDrag: false,
            mouseDrag: false,
            addClassActive: true,
            transitionStyle: 'fade'
        });
    }

    /**
     * Init showroom-related
     */
    var _showroomRelated = _body.find('#showroom-related');
    if ( _showroomRelated.exist() ) {
        _showroomRelated.owlCarousel({
            items: 4,
            itemsDesktop : [1199, 3],
            itemsDesktopSmall : [979, 2],
            itemsTablet : [768, 2],
            itemsTabletSmall : [479, 2],
            itemsMobile : [479, 1],
            autoPlay: 20000,
            navigation: false,
            pagination: true,
            touchDrag: true,
            mouseDrag: false,
            addClassActive: true,
            transitionStyle: 'fade'
        });
    }

    /**
     * Init photoday Image Slide Show
     */
    var _photodayImages = _body.find('#photodayImages');
    if ( _photodayImages.exist() ) {
        _photodayImages.owlCarousel({
            items: 1,
            itemsDesktopSmall : [979, 3],
            itemsTablet : [768, 3],
            itemsMobile : [479, 1],
            autoPlay: 20000,
            navigation: true,
            pagination: false,
            lazyLoad: true,
            touchDrag: true,
            autoHeight: true,
            mouseDrag: false,
            addClassActive: true,
            transitionStyle: 'fade',
            navigationText : ["Пред.", "Сдед."]
        });
    }


    var _legend = _body.find('.legend'),
        _legend_container = _legend.find('.container');

    _legend_container.children().height(_legend_container.height());


    /**
     * Init Best model Slide Show
     */
    var _bestSlideShow = _body.find('#bestSlideShow');
    if ( _bestSlideShow.exist() ) {
        _bestSlideShow.owlCarousel({
            items: 1,
            autoPlay: false,
            singleItem: true,
            navigation: true,
            pagination: true,
            lazyLoad: true,
            touchDrag: false,
            mouseDrag: false,
            addClassActive: true,
            transitionStyle: 'fade'
        });
    }


    /**
     * Init Best model Slide Show
     */
    var _photodaysSlideShow = _body.find('#photodaysSlideShow');
    if ( _photodaysSlideShow.exist() ) {
        _photodaysSlideShow.owlCarousel({
            items: 1,
            autoPlay: false,
            singleItem: true,
            navigation: true,
            pagination: true,
            lazyLoad: true,
            touchDrag: false,
            mouseDrag: false,
            stopOnHover: true,
            addClassActive: true,
            transitionStyle: 'fade'
        });
    }


    /**
     * Init Best model Slide Show
     */
    var aboutCarousel = _body.find('#aboutCarousel');
    if ( aboutCarousel.exist() ) {
        aboutCarousel.owlCarousel({
            items: 1,
            autoPlay: false,
            singleItem: true,
            navigation: true,
            pagination: true,
            lazyLoad: true,
            touchDrag: false,
            mouseDrag: false,
            stopOnHover: true,
            addClassActive: true,
            transitionStyle: 'fade'
        });
    }


    /**
     * Init showroom Carousels
     */
    var showroomCarousels = _body.find('#showroomCarousels');
    if ( showroomCarousels.exist() ) {
        showroomCarousels.owlCarousel({
            items: 1,
            autoPlay: false,
            singleItem: true,
            navigation: true,
            pagination: true,
            lazyLoad: true,
            mouseDrag: false,
            autoHeight: true,
            stopOnHover: true,
            addClassActive: true,
            transitionStyle: 'fade'
        });
    }


    /**
     * Init showroom Images
     */
    var _showroomImages = _body.find('#showroomImages');
    if ( _showroomImages.exist() ) {
        _showroomImages.owlCarousel({
            items: 1,
            autoPlay: false,
            singleItem: true,
            navigation: true,
            pagination: true,
            lazyLoad: true,
            touchDrag: false,
            mouseDrag: false,
            stopOnHover: true,
            addClassActive: true,
            transitionStyle: 'fade'
        });
    }


    /**
     * Init franchise Carousel
     */
    var _franchise = _body.find('#franchiseCarousel');
    if ( _franchise.exist() ) {
        _franchise.owlCarousel({
            items: 5,
            autoPlay: 3000,
            navigation: true,
            pagination: false
        });

        _franchise.magnificPopup({
            type: 'image',
            delegate: 'a',
            gallery: {
                enabled:true
            }
        });
    }


    /**
     * Init article Carousel
     */
    var _articleCarousel = _body.find('#articleCarousel');
    if ( _articleCarousel.exist() ) {
        _articleCarousel.owlCarousel({
            items: 5,
            autoPlay: 3000,
            navigation: true,
            pagination: false
        });

        _articleCarousel.magnificPopup({
            type: 'image',
            delegate: 'a',
            gallery: {
                enabled:true
            }
        });
    }
});


/**
 * Fixed footer on bottom
 */
function fixedFooter() {
    var _footer = _body.find('footer'),
        footerHeight = _footer.innerHeight(),
        _wrapper = _body.find('.wrapper');

    _footer.css({'height' : footerHeight});
    _wrapper.css({'margin-bottom': -parseInt(footerHeight)});
}


/**
 *  After load page
 */
$(window).load(function () {
    /**
     * Init Legend Carousel
     */
    var _legendCarousel = _body.find('#legendCarousel');
    if ( _legendCarousel.exist() ) {
        for (var i = 1; i < 20; i++) {
            if ( _body.find('#legend-images-' + i).exist() ) {
                var _this = _body.find('#legend-images-' + i);

                _this.masonry({
                    itemSelector: 'a',
                    columnWidth: 1
                });
            }
        }

        _legendCarousel.owlCarousel({
            items: 1,
            touchDrag: false,
            mouseDrag: false,
            singleItem: true,
            autoPlay: false,
            navigation: true,
            pagination: true,
            paginationNumbers: true,
            addClassActive: true,
            autoHeight: true,
            transitionStyle: 'fade'
        });

        _legendCarousel.magnificPopup({
            type: 'image',
            delegate: 'a',
            gallery: {
                enabled:true
            }
        });
    }
});


/**
 *  After load page
 */
$(window).load(function () {
    _body.addClass('is-load');

    setTimeout(function () {
        if(is.desktop()){
            var s = skrollr.init();
        }
    }, 200);

    /**
     * Init Slide Show controls
     */
    var _slideShow = _body.find('#homeSlideShow');
    if ( _slideShow.exist() ) {
        var _controls = _slideShow.find('.owl-controls'),
            _controls_container = _body.find('.s-nav__container');

        _controls.detach().appendTo( _controls_container );
    }


    /**
     * Init Legend controls
     */
    var _legendCarousel = _body.find('#legendCarousel');
    if ( _legendCarousel.exist() ) {
        var _controls = _legendCarousel.find('.owl-controls .owl-pagination'),
            _controls_container = _body.find('#legend-control');

        _controls.detach().appendTo( _controls_container );

        $.each(_legendCarousel.find('*[data-toggle="legend-item"]'), function (index, value) {
            var _this = $(this),
                year = _this.attr('data-year'),
                i = index + 1;

            _controls_container.find('.owl-page:nth-child('+ i +') .owl-numbers').text(year);
        });

        $(document).on('click', '.owl-page, .owl-buttons > div', function () {
            for (var i = 0; i < 20; i++) {
                _controls.removeClass('active-' + i);
            }

            setTimeout(function () {
                var index_active = _controls.find('.owl-page.active').index();

                _controls.addClass('active-' + index_active);
            }, 100);
        });
    }


    /**
     * Init block showroom in home page
     */
    var _shop = _body.find('#shop');
    if (_body.hasClass('common-home') && _shop.exist()) {
        var _shopHeight = _shop.find('.shop-description').outerHeight(false),
            _shopMargin = _shop.find('.shop-description').css("margin-bottom");

        _shop.find('.shop-col:nth-child(2)').css({'padding-top' : parseInt(_shopHeight) + parseInt(_shopMargin)});
    }


    /**
     * Init Best model Slide Show controls
     */
    var _photodaysSlideShow = _body.find('#photodaysSlideShow');
    if (_photodaysSlideShow.exist()) {
        var _description = _body.find('.photodays-description'),
            _controls = _photodaysSlideShow.find('.owl-controls'),
            _controls_container = _body.find('.photodays-controls');

        _controls.detach().appendTo( _controls_container );
    }


    /**
     * Init Best model Slide Show controls
     */
    var _bestSlideShow = _body.find('#bestSlideShow');
    if ( _bestSlideShow.exist() ) {
        setTimeout(function () {
            var _controls = _bestSlideShow.find('.owl-controls'),
                _controls_container = _body.find('.best-controls');

            var controlsTop = _body.find('.best-image__controls').first().offset().top,
                controlsLeft = _body.find('.best-image__controls').first().offset().left;

            _controls.detach().appendTo( _controls_container );
            _controls_container.css({'left': controlsLeft, 'top' : controlsTop});
        }, 100);
    }


    /**
     * Init about Carousel controls
     */
    var _aboutCarousel = _body.find('#aboutCarousel');
    if ( _aboutCarousel.exist() ) {
        setTimeout(function () {
            var _controls = _aboutCarousel.find('.owl-controls'),
                _controls_container = _body.find('.about-carousels__controls');

            var controlsTop = _body.find('.owl-item.active .about-carousel__control').position().top,
                controlsLeft = _body.find('.owl-item.active .about-carousel__control').position().left;

            _controls.detach().appendTo( _controls_container );
            _controls_container.css({'left': controlsLeft, 'top' : controlsTop});
        }, 100);
    }


    /**
     * Init showroom Carousel controls
     */
    var _showroomCarousels = _body.find('#showroomCarousels');
    if ( _showroomCarousels.exist() ) {
        setTimeout(function () {
            var _controls = _showroomCarousels.find('.owl-controls'),
                _controls_container = _body.find('.showroom-expert__controls');

            _controls.detach().appendTo( _controls_container );
        }, 100);
    }


    /**
     *  Init accordion on faq page
     */
    var _pageFaq = _body.find('.faq');
    if ( _pageFaq.exist() ) {
        $(".faq-items").accordion({
            active: false,
            collapsible: true,
            heightStyle: "content"
        });
    }


    /**
     *  Init Map
     */
    var _pageContact = $('body.information-contact');
    if ( _pageContact ) {
        var _contact_row = _pageContact.find('.contact-row');

        _contact_row.find('.contact-col').height(_contact_row.height());

        var searchMap = function searchMap() {
            var map = $('#contactMap'),
                lat  = 55.787424,
                long = 37.582885;

                // lat = 49.9999114,
                // long = 36.2346487;

            if (map.length >= 1) {
                var markerPosition = new google.maps.LatLng(lat, long);
                var centerPosition = new google.maps.LatLng(lat, long);

                var infowindow = new google.maps.InfoWindow({
                    content: data
                });

                var mapOptions = {
                    zoom: 17,
                    center: centerPosition,
                    scrollwheel: false,
                    navigationControl: false,
                    mapTypeControl: false,
                    scaleControl: false,
                    draggable: true,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    styles: [{
                        "featureType": "all",
                            "elementType": "all",
                            "stylers": [{"saturation": "-100"}]
                        }, {
                            "featureType": "administrative",
                            "elementType": "all",
                            "stylers": [{"saturation": "-100"}]
                        }, {
                            "featureType": "administrative",
                            "elementType": "labels.text.fill",
                            "stylers": [{"saturation": "-100"}, {"lightness": "-30"}, {"gamma": "1.00"}]
                        }, {
                            "featureType": "administrative.land_parcel",
                            "elementType": "all",
                            "stylers": [{"saturation": "-100"}]
                        }, {
                            "featureType": "administrative.land_parcel",
                            "elementType": "geometry.stroke",
                            "stylers": [{"lightness": "0"}, {"saturation": "-100"}, {"gamma": "1.00"}]
                        }, {
                            "featureType": "landscape",
                            "elementType": "geometry.fill",
                            "stylers": [{"color": "#f2f2f2"}]
                        }, {
                            "featureType": "landscape.man_made",
                            "elementType": "all",
                            "stylers": [{"hue": "#ff0000"}, {"saturation": "-100"}]
                        }, {
                            "featureType": "landscape.man_made",
                            "elementType": "geometry.stroke",
                            "stylers": [{"lightness": "-4"}]
                        }, {
                            "featureType": "landscape.natural",
                            "elementType": "all",
                            "stylers": [{"saturation": "-100"}]
                        }, {
                            "featureType": "poi",
                            "elementType": "all",
                            "stylers": [{"visibility": "off"}]
                        }, {
                            "featureType": "poi",
                            "elementType": "geometry.fill",
                            "stylers": [{"saturation": "-100"}, {"lightness": "0"}, {"gamma": "1.00"}]
                        }, {
                            "featureType": "poi.park",
                            "elementType": "geometry.fill",
                            "stylers": [{"visibility": "on"}, {"weight": "1"}, {"saturation": "-80"}, {"lightness": "17"}, {"gamma": "1.2"}]
                        }, {
                            "featureType": "road",
                            "elementType": "all",
                            "stylers": [{"saturation": -100}, {"lightness": 45}]
                        }, {
                            "featureType": "road",
                            "elementType": "geometry.fill",
                            "stylers": [{"lightness": "9"}]
                        }, {
                            "featureType": "road",
                            "elementType": "geometry.stroke",
                            "stylers": [{"lightness": "0"}, {"gamma": "1"}]
                        }, {
                            "featureType": "road",
                            "elementType": "labels.text.fill",
                            "stylers": [{"lightness": "-43"}]
                        }, {
                            "featureType": "road.highway",
                            "elementType": "all",
                            "stylers": [{"visibility": "simplified"}]
                        }, {
                            "featureType": "road.arterial",
                            "elementType": "labels.icon",
                            "stylers": [{"visibility": "off"}]
                        }, {
                            "featureType": "transit",
                            "elementType": "all",
                            "stylers": [{"saturation": "-100"}, {"lightness": "0"}]
                        }, {
                            "featureType": "transit.line",
                            "elementType": "all",
                            "stylers": [{"visibility": "off"}]
                        }, {
                            "featureType": "transit.line",
                            "elementType": "geometry",
                            "stylers": [{"lightness": "-50"}, {"gamma": "1.00"}, {"visibility": "off"}]
                        }, {
                            "featureType": "transit.station.airport",
                            "elementType": "geometry",
                            "stylers": [{"saturation": "-77"}, {"gamma": "1.79"}, {"lightness": "23"}]
                        }, {
                            "featureType": "transit.station.bus",
                            "elementType": "all",
                            "stylers": [{"visibility": "off"}]
                        }, {
                            "featureType": "transit.station.rail",
                            "elementType": "labels.icon",
                            "stylers": [{"gamma": "1.00"}, {"lightness": "40"}, {"weight": "1"}, {"saturation": "-100"}]
                        }, {
                            "featureType": "water",
                            "elementType": "all",
                            "stylers": [{"color": "#f4f4f4"}, {"visibility": "on"}]
                        }, {
                            "featureType": "water",
                            "elementType": "geometry.fill",
                            "stylers": [{"visibility": "on"}, {"lightness": "-20"}, {"saturation": "-90"}, {"gamma": "1.00"}]
                        }, {
                            "featureType": "water",
                            "elementType": "labels.text.fill",
                            "stylers": [{"lightness": "-39"}, {"saturation": "-100"}]
                        }, {
                            "featureType": "water",
                            "elementType": "labels.text.stroke",
                            "stylers": [{"lightness": "55"}]
                        }]
                };
                var map = new google.maps.Map(document.getElementById("contactMap"), mapOptions);
                var iconBase = '/image/theme/map-marker.png';
                var marker = new google.maps.Marker({
                    position: markerPosition,
                    map: map,
                    icon: iconBase
                });
                var data = '';
                marker.setMap(map);
            }
        };
        searchMap();
    }
});

// Cart add remove functions
var cart = {
    'add': function(product_id, quantity) {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
            dataType: 'json',
            beforeSend: function() {
                $('#cart > button').button('loading');
            },
            complete: function() {
                $('#cart > button').button('reset');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();

                if (json['redirect']) {
                    location = json['redirect'];
                }

                if (json['success']) {
                    $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    // Need to set timeout otherwise it wont update the total
                    setTimeout(function () {
                        $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
                    }, 100);

                    $('html, body').animate({ scrollTop: 0 }, 'slow');

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    },
    'update': function(key, quantity) {
        $.ajax({
            url: 'index.php?route=checkout/cart/edit',
            type: 'post',
            data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
            dataType: 'json',
            beforeSend: function() {
                $('#cart > button').button('loading');
            },
            complete: function() {
                $('#cart > button').button('reset');
            },
            success: function(json) {
                // Need to set timeout otherwise it wont update the total
                setTimeout(function () {
                    $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
                }, 100);

                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    },
    'remove': function(key) {
        $.ajax({
            url: 'index.php?route=checkout/cart/remove',
            type: 'post',
            data: 'key=' + key,
            dataType: 'json',
            beforeSend: function() {
                $('#cart > button').button('loading');
            },
            complete: function() {
                $('#cart > button').button('reset');
            },
            success: function(json) {
                // Need to set timeout otherwise it wont update the total
                setTimeout(function () {
                    $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
                }, 100);

                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }
}

/* Agree to Terms */
$(document).delegate('.agree', 'click', function(e) {
    e.preventDefault();

    $('#modal-agree').remove();

    var element = this;

    $.ajax({
        url: $(element).attr('href'),
        type: 'get',
        dataType: 'html',
        success: function(data) {
            html  = '<div id="modal-agree" class="modal fade">';
            html += '  <div class="modal-dialog">';
            html += '    <div class="modal-content">';
            html += '      <div class="modal-header">';
            html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
            html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
            html += '      </div>';
            html += '      <div class="modal-body">' + data + '</div>';
            html += '    </div';
            html += '  </div>';
            html += '</div>';

            $('body').append(html);

            $('#modal-agree').modal('show');
        }
    });
});