// This is a client side javascript file

$j = jQuery.noConflict();

$j(function(){
 	$j('.checkAllContainer .checkAllHeader').change(function() {
 		$j(this).closest('.checkAllContainer').find('.checkAllRow').prop('checked', this.checked);	
 	});
 	
 	$j('.checkAllContainer .checkAllRow').change(function() {
 		var l = $j(this).closest('.checkAllContainer').find('.checkAllRow').filter(':not(:checked)').length;
 		$j(this).closest('.checkAllContainer').find('.checkAllHeader').prop('checked', l == 0);	
 	});
});