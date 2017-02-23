jQuery(document).ready(function($) {

    $('.header-slide').owlCarousel({
        items: 1
    });

    $('.tips-slide').owlCarousel({
        items: 3,
        responsive:{
            0:{
                items:1,
            },
            600:{
                items:3,
                nav:false
            }
        }
    });

});
