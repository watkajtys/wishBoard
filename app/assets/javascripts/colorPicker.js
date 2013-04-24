$(document).ready(function(){
   var colors = $('.picker');
   colors.click(function (){
      var chosen = $(this).data('color');
      
      $('input[type="text"]').css('color', chosen)
      $('#post_color').val(chosen);
      return false;
   });
});