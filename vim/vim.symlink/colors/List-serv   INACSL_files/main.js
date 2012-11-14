!(function($){
	// nav/subnav dropdown
  $('.expanded').mouseenter(function() {
		$(this).children('ul').show();
		$(this).addClass('open');
		return false;
	});
	$('.expanded').mouseleave(function() {
		$(this).children('ul').hide();
		$(this).removeClass('open');
		return false;
	});

	$('footer .icons a').hover(function(){
    var img = $(this).find('img');
    var img_array = img.attr('src').split('.');
    var concat = '';
    $.each(img_array, function(index, value){
      switch (index) {
        case 0:
          concat += value;
          break;

        case img_array.length - 1:
          concat += '-hover.' + value;
          break;

        default:
          concat += '.' + value;
          break;
      };
    });

    img.attr('src', concat);
  },function() {
      var img = $(this).find('img');
      img.attr('src', img.attr('src').replace('-hover', ''));
  });

  $('a[rel="tooltip"]').tooltip();

  // Set starting slide to 1
  var startSlide = 1;
  // Get slide number if it exists
  if (window.location.hash) {
    startSlide = window.location.hash.replace('#','');
  }

  $('#slides').slides({
    play: 4000,
    paginationClass: 'pagination_new',
    generatePagination: true,
    // Get the starting slide
    start: startSlide,
    effect:'slide',
    animationComplete: function(current){
      // Set the slide number as a hash
    }
  });

  /**
   * @author    Clay Baucom, SankyNet <cbaucom@sankynet.com>
   * @date      2012-09-24
   * @comments  Search bar hover on search button changes border color of search input feild
   **/
  $(function(){
    $("#main-search-btn").hover(
          function(){
              $("#main-search-btn").css('border-color','#5A419C');
              $("#appendedInput").css('border-color','#5A419C');
          },
          function(){
              $("#main-search-btn").css('border-color','#cccccc');
              $("#appendedInput").css('border-color','#cccccc');
          }
      );
  });

  /**
   * @author    Matt Ryan, SankyNet <mryan@sankynet.com>
   * @date      2012-10-17
   * @comments  imag captions
   **/
  $(window).load(function(){
    $(".field-name-field-main-image img").each(function() {
      var imageCaption = $(this).attr("alt");

      if (imageCaption != '') {
        var imgWidth = $(this).width() - 20;
        var imgHeight = $(this).height();
        var position = $(this).position();
        var positionTop = (position.top + imgHeight - 26);

        $("<span class='main-img-caption'><em>"+imageCaption+"</em></span>").css({"position":"absolute", "top":positionTop+"px", "left":"0", "width":imgWidth +"px"}).insertAfter(this);
      }

    });
  });


})(jQuery)
