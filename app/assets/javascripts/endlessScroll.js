$(document).ready(function(){
   $(window).scroll(function(){
      var totalHeight = document.body.offsetHeight;
      var visibleHeight = document.documentElement.clientHeight;
      var currentScroll = $(document).scrollTop();
      var page = 1,loading = false;

      if (visibleHeight + currentScroll >= totalHeight) {
         console.log('bottom');
         page++;
         console.log(page);
         loading = true;
         // $.ajax({
         //    url: '/index?page=' + page;
         //    type: 'get',
         //    dataType:
            // sucess: function() {
            //    $(window).append();
            //    loading = false;
            // }
      };
   });
});