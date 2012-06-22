// JavaScript Document

jQuery(document).ready(function ($) {
	$('.agenda h1').click(function() {
		$(this).next().toggle('slow');
		return false;
	}).css('cursor', 'pointer');
});