$(function() {
  $('.button-collapse').sideNav();

  $('#show-search').on('click', function() {
    $(this).find('.is-transparent').toggleClass('is-transparent').siblings().toggleClass('is-transparent');
    $('#search-box').slideToggle();
  });

  $(window).on('resize', function(e) {
    if (window.innerWidth > 992) {
      $('#search-box').hide();
      $('#show-search .material-icons').removeClass('is-transparent').siblings().addClass('is-transparent');
    }
  });
});
