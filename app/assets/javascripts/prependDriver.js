$(document).ready(function(){

   var getRandomNumber = function(max){
      return Math.floor(Math.random()*(max+1));
   }

   var placeholders=["upon a star.", "to travel the world!", "my dog."]
   var prepends=["I wish", "I want", "I miss"], 
         n_max = 2, 
             n = getRandomNumber(n_max);
   
   var selectedPlaceholder = (placeholders[n]);
   var selectedPrepend = (prepends[n]);

   $('.prompt').text(selectedPrepend);
   $('#post_prepend').val(selectedPrepend);
   $('#post_entry').attr("placeholder", selectedPlaceholder);

   $(".left, .right").click(function(){
      n += $(this).hasClass('left') ? 1 : -1;
      if (n > n_max) n = 0;
      if (n < 0) n = n_max;

      var selectedPlaceholder = (placeholders[n]);
      var selectedPrepend = (prepends[n]);
      
      $('.prompt').text(selectedPrepend);
      $('#post_prepend').val(selectedPrepend);
      $('#post_entry').attr("placeholder", selectedPlaceholder);
      return false;
   });
});