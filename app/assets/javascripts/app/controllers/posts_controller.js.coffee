@inspire.controller "PostsController", ($scope, Post, postService) ->
   
   $scope.initializeNewPost = ->
      $scope.newPost = {isNew: true}
      $scope.posts.unshift $scope.newPost

   postService.async().then (data) ->
      $scope.posts = data
      $scope.initializeNewPost()
      console.log 'posts', $scope.posts

   $scope.savePost = ->
      Post.save $scope.newPost,
         (data) ->

            # $scope.posts.unshift $scope.newPost # appending
            $scope.newPost.isNew = false
            console.log 'appended posts:', $scope.posts
            $scope.initializeNewPost()

            console.log(data)
         (response) ->
            $scope.errors = response.data.errors
            console.log($scope.errors)
