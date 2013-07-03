@inspire.controller "PostsController", ($scope, Prepend, Post, postService) ->


   # $scope.NewPost = { prepend : "I wish" }

   $scope.options = ['I wish', 'I want', 'I miss']

   $scope.iteratePromptUp = ->
      max = $scope.options.length - 1
      $scope.choice = $scope.choice + 1
      $scope.choice = 0 if $scope.choice > max
      $scope.chosen = $scope.options[$scope.choice]

   $scope.iteratePromptDown = ->
      max = $scope.options.length - 1
      $scope.choice = $scope.choice - 1
      $scope.choice = 0 if $scope.choice > max
      $scope.choice = max if $scope.choice < 0
      $scope.chosen = $scope.options[$scope.choice]

   $scope.selectPrompt = ->
      $scope.choice = Math.floor(Math.random()*3)
      $scope.chosen = $scope.options[$scope.choice]

   $scope.initializeNewPost = ->
      $scope.selectPrompt()
      $scope.newPost = { isNew: true, prepend: $scope.chosen }
      $scope.posts.unshift $scope.newPost

   $scope.$watch "chosen", ->
      $scope.newPost.prepend = $scope.chosen

   postService.async().then (data) ->
      $scope.posts = data
      $scope.initializeNewPost()
      # console.log 'posts', $scope.posts

   $scope.savePost = ->
      Post.save $scope.newPost,
         (data) ->
            # $scope.posts.unshift $scope.newPost # appending
            $scope.newPost.isNew = false
            # console.log 'appended posts:', $scope.posts
            $scope.initializeNewPost()
         (response) ->
            $scope.errors = response.data.errors
            console.log($scope.errors)
