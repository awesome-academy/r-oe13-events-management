$(document).ready(function() {
  $(window).on('scroll', function() {
    var wScroll = $(this).scrollTop();
    wScroll > $('#header').height() ? $('#nav-header').addClass('fixed') : $('#nav-header').removeClass('fixed');
    wScroll > 740 ? $('#back-to-top').addClass('active') : $('#back-to-top').removeClass('active')
  });

  $('#back-to-top').on('click', function(){
    $('body,html').animate({scrollTop: 0}, 500);
  });

  $('#nav-header .search-collapse-btn').on('click',function(){
    $(this).toggleClass('active');
    $('.search-form').toggleClass('search-collapse');
  });
});
