$(function() {
  if ($('h4').data('search-results') && window.innerWidth < 993) {
    $('#search-box').show();
    $('#show-search .material-icons').addClass('is-transparent').siblings().removeClass('is-transparent');
  }

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
