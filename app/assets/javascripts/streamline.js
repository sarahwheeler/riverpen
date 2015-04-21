// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$('.left-tab').click(function (e) {
  e.preventDefault();
  console.log("LEFT TAB CALLED!");
  $('#me').slideToggle("show");
});

$('.middle-tab').click(function (e) {
  e.preventDefault();
  console.log("MIDDLE TAB CALLED!");
  $('#following').slideToggle("show");
});

$('.right-tab').click(function (e) {
  e.preventDefault();
  console.log("RIGHT TAB CALLED!");
  $('#followers').slideToggle("show");
});
