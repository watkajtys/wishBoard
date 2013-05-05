$(document).ready(function(){
   var page = 1;
   var loading = false;
   var $posts = $('.posts');

   var onScroll = function(){
      var totalHeight = document.body.offsetHeight;
      var visibleHeight = document.documentElement.clientHeight;
      var currentScroll = $(document).scrollTop();

      if (visibleHeight + currentScroll >= totalHeight + 250 && loading == false) {
         page++;
         loading = true;
         console.log('bottom');
         $.ajax({
            url: '/index.json?page=' + page,
            type: 'get',
            dataType: "json", 
            success: onAjaxSuccess
         })
      };
   };

   var onAjaxSuccess = function(data, status, xhr) {
      for (var i = 0; i<data.length; i++){
         var $div = $('<h2>');
         $('<span>').addClass('prepend').html(data[i].prepend).appendTo($div);
         $('<span>').addClass('entry').html(data[i].entry).css({color: data[i].color}).appendTo($div);
         $div.appendTo($posts);
      }
      loading = false;
   };

   $(window).scroll(onScroll);
});