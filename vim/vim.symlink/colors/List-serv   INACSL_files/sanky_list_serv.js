(function ($) {

  Drupal.behaviors.sanky_list_serv = {
    attach: function (context, settings) {
      $('.thread-detail .purple-arrow').click(function(){
        $('.thread-detail .thread.active').removeClass('active');
        $(this).parents('.thread').addClass('active');
      });
    }
  };

})(jQuery);
