var DailyMealSite = DailyMealSite || {};

DailyMealSite.initSelectLanguage = function(){
    var $form = $('#set-language-form');
    var $sl = $('#select-language');
    $sl.on('change', function(){
	$form.submit();
    })
}

DailyMealSite.initTransQtip = function(){
    $('.trans-edit').each(function(){
	$(this).qtip({
	    content: {
		text: '<a class="trans-edit-fancy" data-key='+this.id+'>Edit translation!</a>',
		title: { text: 'Translation', button: true}
	    },
	    hide: 'unfocus',
	    show: {solo: true},
	    style: { border: { width: 5, radius: 10 },
		     padding: 10, 
		     textAlign: 'center',
		     tip: true, // Give it a speech bubble tip with automatic corner detection
		     name: 'cream' // Style it according to the preset 'cream' style
		   },
	    events: {
		show: function(event, api) {
		    
		}

	    }

	})
    })
}

DailyMealSite.initPopupTrForm = function(){
    $(document).on('click', '.trans-edit-fancy', function(){
	$.fancybox.showLoading();
	$('div.qtip:visible').qtip('hide');
	$.fancybox({
	    type: "ajax",
	    href: "/translation?key=" + $(this).attr("data-key"),
	    width   : 500,
	    autoSize: false,
	    height    : 500,
	    success: function() {
		$.fancybox.hideLoading();
		
	    }
	}); 
	return false;
    })
}