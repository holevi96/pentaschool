jQuery(document).ready(function(){
    jQuery("#card").flip({
        trigger: 'manual'
    });
    jQuery('.tanfolyam-kiirasok-box ul li').eq(0).click();

    $( "body" ).delegate( ".reszletes_idopontok", "click", function() {
        console.log('asd')
        e.preventDefault();
        jQuery("#card").flip('toggle');
    });
})