$(document).ready(function(){
   var prepends=["I wish", "I want", "I miss"], n_max = 2, n = 0;
   $('.prompt').text(prepends[n])
   $(".left, .right").click(function(){
      n += $(this).hasClass('left') ? 1 : -1;
      if (n > n_max) n = 0;
      if (n < 0) n = n_max;

      $('.prompt').text(prepends[n]);
      $('#post_prepend').val(prepends[n]);
      return false;
   });
});