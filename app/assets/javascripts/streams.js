// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
	$('.post-reply').on('click', function(){
		console.log("THIS SHIT RIGHT HERE IS BEING CALLED");
		$('.view-post-reply').show();
	});
});