jQuery(document).ready(function(){
    jQuery('.tanfolyam-kiirasok-box ul li').eq(0).click();
    jQuery('.reszletes_idopontok').click(function(){
        jQuery("#card").flip('toggle');
    })
})