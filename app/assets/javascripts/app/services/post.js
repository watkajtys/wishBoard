inspire.factory('postService', function($http) {
  var postService = {
    async: function() {
      var promise = $http.get('/api/v1/posts.json').then(function (response) {
        console.log(response);
        return response.data;
      });
      return promise;
    }
  };
  return postService;
});