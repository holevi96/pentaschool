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
})