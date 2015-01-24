// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

	// Comment Toggles
	$('.view-post-reply').on('click', function(){
		console.log("THIS SHIT RIGHT HERE IS BEING CALLED");
		$('.post-reply').toggle();
	});

	$('.view-post-comments').on('click', function(){
		console.log("THIS VIEW ALL IS BEING CALLED");
		$('.post-comments').toggle();
	});

});