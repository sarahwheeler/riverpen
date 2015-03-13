// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$('#me a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
});

$('#following a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
});

$('#followers a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
});
