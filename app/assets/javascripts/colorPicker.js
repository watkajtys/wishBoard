$(document).ready(function(){
   var colors = $('.picker');
   colors.click(function (){
       chosen = $(this).data('color');
       console.log(chosen);
   });
});