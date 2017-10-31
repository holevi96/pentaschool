 (function( $ ) {
 
    $.fn.pentafilter = function(filterwrapper, options) {
		
		 var settings = $.extend({
            // These are the defaults.
            time: 300
        }, options );
		
		var container = this;
	
		var effect = $('#'+filterwrapper).attr('effect-type');	
		
		$('#'+filterwrapper + " .pentafilter a").click(function(){
			$('#'+filterwrapper + " .pentafilter a").removeClass('active');
			$(this).addClass('active');
			var classList = $(this).parent().attr('termName').split(/\s+/);
			$(container).attr('visible','none');
			$.each(classList, function(index, item) {
				$(container.selector + '[termname*=' + item + ']').attr('visible','visible');
			});
			if(jQuery(container.selector + '[visible*="visible"]').length == 0){
				jQuery(container).find('.notfound').attr('visible','visible');
			}
			if(effect = 'fade'){
				jQuery(container.selector ).velocity("fadeOut", { duration: 300 })
				jQuery(container.selector + '[visible*="visible"]').velocity("fadeIn", { delay: 100, duration: 300 });
			}

		})
		
		
 
       
 
    };
 
}( jQuery ));
 