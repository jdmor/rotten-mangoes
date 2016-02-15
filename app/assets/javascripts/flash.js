$(function() {
  if (!!document.getElementById('flash-messages')) {
    var messages = $('#flash-messages li');
    $(messages).each(function() {
      Materialize.toast($(this).data('flash-message'), 6000);
    });
  }
});