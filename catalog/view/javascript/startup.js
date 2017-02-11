/**
 * Created by Qiker on 31.10.2016.
 */

const _body = $('body'),
    _content = _body.find('#content');

jQuery.fn.exist = function() {
    var exist;
    this.length >= 1 ? exist = true : exist = false;
    return exist;
};


/**
 * Exist function's
 */
$(function () {
    var $element = $(".page.contact");
    if ( $element.exist() ) {

    }
});


/**
 * Init Slide Show
 */
var _slideShow = _body.find('#slideshow0');
if ( _slideShow.exist() ) {
    _slideShow.owlCarousel({
        items: 6,
        autoPlay: 3000,
        singleItem: true,
        navigation: true,
        navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
        pagination: true
    });
}


/**
 * Init Carousel
 */
var _carousel = _body.find('#carousel0');
if ( _carousel.exist() ) {
    _carousel.owlCarousel({
        items: 6,
        autoPlay: 3000,
        navigation: true,
        navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
        pagination: true
    });
}


/**
 * Init Banner
 */
var _banner = _body.find('#banner0');
if ( _banner.exist() ) {
    _banner.owlCarousel({
        items: 6,
        autoPlay: 3000,
        singleItem: true,
        navigation: false,
        pagination: false,
        transitionStyle: 'fade'
    });
}


/**
 * Init Auto Complete: Search
 */
$('#search_query').autocomplete({
    delay: 0,
    minLength: 3,
    appendTo: "#auto_complete-results",
    source: function(request, response) {
        $.ajax({
            url: 'index.php?route=product/search/autocomplete&filter_name=' +  encodeURIComponent(request.term),
            dataType: 'json',
            success: function(json) {
                response($.map(json, function(item) {
                    return {
                        label: item.name,
                        value: item.product_id,
                        href: item.href,
                        thumb: item.thumb,
                        desc: item.desc,
                        price: item.price
                    }
                }));
            }
        });
    },
    select: function(event, ui) {
        document.location.href = ui.item.href;

        return false;
    },
    focus: function(event, ui) {
        return false;
    }
}).data( "ui-autocomplete" )._renderItem = function( ul, item ) {
    return $( "<li>" )
        .data( "ui-autocomplete-item", item )
        .append( "<a>" + item.label + "<br>" + item.desc + "</a>" )
        .appendTo( ul );
};


/**
 * Init Search
 */
$('#button-search').bind('click', function() {
    var url = 'index.php?route=product/search',
        search = _content.find('input[name=\'search\']').prop('value');

    if (search) {
        url += '&search=' + encodeURIComponent(search);
    }

    var category_id = _content.find('select[name=\'category_id\']').prop('value');

    if (category_id > 0) {
        url += '&category_id=' + encodeURIComponent(category_id);
    }

    var sub_category = _content.find('input[name=\'sub_category\']:checked').prop('value');

    if (sub_category) {
        url += '&sub_category=true';
    }

    var filter_description = _content.find('input[name=\'description\']:checked').prop('value');

    if (filter_description) {
        url += '&description=true';
    }

    location = url;
});

_content.find('input[name=\'search\']').bind('keydown', function(e) {
    if (e.keyCode == 13) {
        _body.find('#button-search').trigger('click');
    }
});

_body.find('select[name=\'category_id\']').on('change', function() {
    if (this.value == '0') {
        _body.find('input[name=\'sub_category\']').prop('disabled', true);
    } else {
        _body.find('input[name=\'sub_category\']').prop('disabled', false);
    }
});

_body.find('select[name=\'category_id\']').trigger('change');