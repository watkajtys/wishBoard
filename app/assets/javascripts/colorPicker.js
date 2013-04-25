$(document).ready(function(){
   var colors = $('.picker');
   colors.click(function (e){
      var chosen = $(this).data('color');
      
      $('input[type="text"]').css('color', chosen)
      $('#post_color').val(chosen);
      e.preventDefault();
   });
});