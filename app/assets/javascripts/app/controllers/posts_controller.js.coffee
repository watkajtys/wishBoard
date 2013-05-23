@inspire.controller "PostsController", ($scope, Post, postService) ->
   
   postService.async().then (data) ->
      $scope.posts = data
      console.log 'posts', $scope.posts

   $scope.savePost = ->
      Post.save $scope.newPost,
         (data) ->
            $scope.posts.unshift $scope.newPost # appending
            console.log 'appended posts:', $scope.posts
            $scope.newPost = null # clearning

            console.log(data)
         (response) ->
            $scope.errors = response.data.errors
            console.log($scope.errors)
