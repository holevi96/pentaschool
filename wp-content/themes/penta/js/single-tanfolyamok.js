jQuery(document).ready(function(){

    jQuery('.tanfolyam-kiirasok-box ul li').eq(0).click();

    jQuery( "body" ).delegate( ".reszletes_idopontok", "click", function(e) {
        console.log('asd')
        e.preventDefault();
        jQuery('.card').toggleClass('flipped');
    });
})