
var setQuick = function() {
  var quick = $('.quick-links');
  var offset = $('.logo').height();
  quick.css('top', (offset + 10) + 'px');
}

/* On Scroll event listener, use this to fix positions */
$(this).scroll(function(event) {
  var scrollOffset = $(this).scrollTop();
  var links = $('.quick-links');
  var logo = $('.logo');

  if(logo.height() > scrollOffset)
    links.css('top', (logo.height() - scrollOffset + 10) + 'px');
  else
    links.css('top', '10px');
});

setQuick();

