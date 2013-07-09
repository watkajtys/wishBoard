@inspire.controller "PostsController", ($scope, Post, $http, postService) ->

   $scope.options = ['I wish', 'I want', 'I miss', 'I love']
   $scope.placeholders = ['upon a star...', 'to travel the world!', 'swinging!', 'thunderstorms!']
   $scope.colors = ['#f3f2f2','#f5989d', '#fff799', '#bd8cbf', '#fdbd89', '#79bcde', '#82ca89']
   $scope.searchFilter = '';

   $scope.pickColor = (color) ->
      $scope.chosenColor = color
      $scope.newPost.color = $scope.chosenColor

   $scope.iteratePrompt = (math) ->
      max = $scope.options.length - 1
      if math == 'up'
         $scope.choice = $scope.choice + 1
         $scope.choice = 0 if $scope.choice > max
      else
         $scope.choice = $scope.choice - 1
         $scope.choice = 0 if $scope.choice > max
         $scope.choice = max if $scope.choice < 0
      $scope.chosen = {prompt: $scope.options[$scope.choice], placeholder: $scope.placeholders[$scope.choice]}

   $scope.selectPrompt = ->
      $scope.choice = Math.floor(Math.random()*4)
      $scope.chosen = {prompt: $scope.options[$scope.choice], placeholder: $scope.placeholders[$scope.choice]}

   $scope.initializeNewPost = ->
      $scope.selectPrompt()
      $scope.newPost = { isNew: true, prepend: $scope.chosen.prompt }
      $scope.posts.unshift $scope.newPost

   $scope.$watch "chosen", ->
      $scope.newPost.prepend = $scope.chosen.prompt

   $scope.posts = []
   $scope.loading = false
   $scope.page = 1

   $scope.nextPage = ->
      return if $scope.loading
      $scope.loading = true
      url = "api/v1/posts.json?page=" + $scope.page
      $http.get(url).success (data) ->
         $scope.posts = $scope.posts.concat(data);
         $scope.loading = false
         $scope.page = $scope.page + 1

   $scope.nextPage()
   $scope.initializeNewPost()

   $scope.savePost = ->
      Post.save $scope.newPost,
         (data) ->
            # $scope.posts.unshift $scope.newPost # appending
            $scope.newPost.isNew = false
            $scope.initializeNewPost()
         (response) ->
            $scope.errors = response.data.errors
            console.log($scope.errors)
