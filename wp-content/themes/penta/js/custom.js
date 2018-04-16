jQuery(document).ready(function(){
	jQuery('.tanfolyam-kiirasok-box .tabs-content').addClass('bg--primary');
	jQuery('.gfield_radio li').each(function(index,item){
		console.log(item)
		var val = jQuery(item).find('input').attr('value')
		jQuery(item).prepend('<span></span>');
		jQuery(item).find('span').text(val);
		jQuery(item).find('label').text('')
		console.log(val);
	})
	jQuery('.process-1 .process__item[visible="visible"]:nth-child(even)').addClass("even").removeClass("odd");
		jQuery('.process-1 .process__item[visible="visible"]:nth-child(odd)').addClass("odd").removeClass("even");
	jQuery('.tanfolyamok .tanfolyam').pentafilter('pentafilter-box',{},function(){
		jQuery('.process-1 div[visible="visible"]:even').addClass("even").removeClass("odd");
		jQuery('.process-1 div[visible="visible"]:odd').addClass("odd").removeClass("even");
		
	});
})