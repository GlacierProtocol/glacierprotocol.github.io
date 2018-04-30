$(function() {

  // $('.collapse').collapse('hide');
  $('.list-group-item.active').parent().parent('.collapse').collapse('show');
  $('[data-toggle="popover"]').popover();

});
