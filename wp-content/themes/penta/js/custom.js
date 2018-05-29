jQuery(document).ready(function(){
	jQuery('.tanfolyam-kiirasok-box .tabs-content').addClass('bg--primary');
	jQuery('.single-tanfolyam-kiiras .gfield_radio li').each(function(index,item){
		console.log(item)
		var val = jQuery(item).find('input').attr('value')
		jQuery(item).prepend('<span></span>');
		jQuery(item).find('span').text(val);
		jQuery(item).find('label').text('')
		console.log(val);
	});
    jQuery('.quiz .gfield_radio li').each(function(index,item){
        console.log(item)
        var val = jQuery(item).find('label').text()
        jQuery(item).prepend('<span></span>');
        jQuery(item).find('span').text(val);
        jQuery(item).find('label').text('')
        console.log(val);
    });
    jQuery('.quiz .gfield_checkbox li').each(function(index,item){
        console.log(item)
        var val = jQuery(item).find('label').text()
        jQuery(item).prepend('<span></span>');
        jQuery(item).find('span').text(val);
        jQuery(item).find('label').text('')
        console.log(val);
    });
	jQuery('.process-1 .process__item[visible="visible"]:nth-child(even)').addClass("even").removeClass("odd");
		jQuery('.process-1 .process__item[visible="visible"]:nth-child(odd)').addClass("odd").removeClass("even");

	jQuery('.tanfolyamok .tanfolyam').pentafilter('pentafilter-box',{},function(){
		jQuery('.process-1 div[visible="visible"]:even').addClass("even").removeClass("odd");
		jQuery('.process-1 div[visible="visible"]:odd').addClass("odd").removeClass("even");

	});

    jQuery('.tanfolyamok .tanfolyam').pentafilter('pentaesti-filter-box',{},function(){
        jQuery('.process-1 div[visible="visible"]:even').addClass("even").removeClass("odd");
        jQuery('.process-1 div[visible="visible"]:odd').addClass("odd").removeClass("even");

    })
    var width = jQuery('.tanfolyamok .process__item.tanfolyam').eq(0).width()
    jQuery('.tanfolyamok .process__item.tanfolyam p').css('width',width+20);


    var getUrlParameter = function getUrlParameter(sParam) {
        var sPageURL = decodeURIComponent(window.location.search.substring(1)),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;

        for (i = 0; i < sURLVariables.length; i++) {
            sParameterName = sURLVariables[i].split('=');

            if (sParameterName[0] === sParam) {
                return sParameterName[1] === undefined ? true : sParameterName[1];
            }
        }
    };



    if(getUrlParameter('id')){

        var tabid = getUrlParameter('id');

        jQuery('.tanfolyam-kiirasok-box .tab__title[data-id="' + tabid +'"]').click();
    }
    function hide_box_month(){
        var month = "";
        jQuery('.home .tanfolyamok .tanfolyam[visible="visible"]').each(function(index,item){
            var act_month = jQuery(item).find('.box-month').html();
            if(act_month != month){
                month = act_month;
                jQuery(item).find('.box-month').css('visibility',"visible");
            }else{
                jQuery(item).find('.box-month').css('visibility',"hidden");
            }
        });
    }
    hide_box_month();

});

jQuery(window).scroll(function() {
    var scroll = jQuery(window).scrollTop();

    if (scroll >= 450) {
        jQuery(".home #pentafilter-box").addClass("fixed");
    } else {
        jQuery(".home #pentafilter-box").removeClass("fixed");
    }
});
