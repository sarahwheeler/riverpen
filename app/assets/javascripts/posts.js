// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


// Streamless Post Creation

$(document).ready( function() {
	$('#stream-select').blur(function() {
		console.log("STREAM-SELECT BLUR IS BEING CALLED");
		var streamId = $('#stream-select').val();
		$("<% f.hidden_field = :stream_id, :value =>" + streamId + " %>").appendTo('#post_content');
	})
})