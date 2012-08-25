// JavaScript Document

jQuery(document).ready(function ($) {
	$('.agenda h1').click(function() {
		$(this).next().toggle('slow');
		return false;
	}).css('cursor', 'pointer');
	
	
	$('.session').click(function(){
		$(this).next().slideToggle('slow');
		return false;
	}).css('cursor', 'pointer').nextAll('span').css('font-weight', 'normal').hide();
	
	
});