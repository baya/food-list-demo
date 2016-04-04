var DailyMealSite = DailyMealSite || {};

DailyMealSite.initSelectLanguage = function(){
    var $form = $('#set-language-form');
    var $sl = $('#select-language');
    $sl.on('change', function(){
	$form.submit();
    })
}