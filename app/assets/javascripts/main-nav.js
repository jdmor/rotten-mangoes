$(function() {
  $('.button-collapse').sideNav();

  $('#show-search').on('click', function() {
    $(this).find('.is-transparent').toggleClass('is-transparent').siblings().toggleClass('is-transparent');
    $('#search-box').slideToggle();
  });
});
