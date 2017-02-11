/**
 * Created by Qiker on 31.10.2016.
 */

function initJQuery() {

    /**
     * Init Slide Show
     */
    $('#slideshow0').owlCarousel({
        items: 6,
        autoPlay: 3000,
        singleItem: true,
        navigation: true,
        navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
        pagination: true
    });

    /**
     * Init Carousel
     */
    $('#carousel0').owlCarousel({
        items: 6,
        autoPlay: 3000,
        navigation: true,
        navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
        pagination: true
    });
}