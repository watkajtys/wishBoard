@inspire.controller "PostsController", ($scope, Prepend, Post, postService) ->


   $scope.NewPost = { prepend : "I wish" }

   $scope.selection = [0, 1, 2]

   $scope.options = ['I wish', 'I want', 'I miss']

   $scope.selectPrompt = ->
      $scope.choice = Math.floor(Math.random()*3)
      console.log $scope.choice
      $scope.chosen = $scope.options[$scope.choice]
      console.log $scope.chosen

   $scope.set = (new_title) ->
      @widget.title = new_title

   $scope.initializeNewPost = ->
      $scope.newPost = {isNew: true, prepend: $scope.chosen}
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
         (response) ->
            $scope.errors = response.data.errors
            console.log($scope.errors)
