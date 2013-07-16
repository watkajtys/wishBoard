@inspire.controller "PostsController", ($scope, Post, $http, postService) ->

   $scope.options = ['I wish', 'I want', 'I miss', 'I love']
   $scope.placeholders = ['upon a star...', 'to travel the world!', 'swinging!', 'thunderstorms!']
   $scope.fonts = ['Coming Soon', 'Sue Ellen Francisco', 'Neucha', 'Schoolbell', 'Loved by the King', 'Annie Use Your Telescope']
   $scope.colors = ['#f3f2f2','#f5989d', '#fff799', '#bd8cbf', '#fdbd89', '#79bcde', '#82ca89']
   $scope.searchFilter = '';

   # $scope.pickFont = (font) ->
   #    $scope.newPost.font = $scope.chosenFont

   $scope.pickColor = (color) ->
      $scope.chosenColor = color
      $scope.newPost.color = $scope.chosenColor

   $scope.iterateFont = (math) -> 
      max = $scope.fonts.length - 1
      if math == 'up'
         $scope.fontChoice = $scope.fontChoice + 1
         $scope.fontChoice = 0 if $scope.fontChoice > max
      else
         $scope.fontChoice = $scope.fontChoice - 1
         $scope.fontChoice = 0 if $scope.fontChoice > max
         $scope.fontChoice = max if $scope.fontChoice < 0
      $scope.chosen = { prompt: $scope.options[$scope.choice], placeholder: $scope.placeholders[$scope.choice], font: $scope.fonts[$scope.fontChoice] }

   $scope.iteratePrompt = (math) ->
      max = $scope.options.length - 1
      if math == 'up'
         $scope.choice = $scope.choice + 1
         $scope.choice = 0 if $scope.choice > max
      else
         $scope.choice = $scope.choice - 1
         $scope.choice = 0 if $scope.choice > max
         $scope.choice = max if $scope.choice < 0
      $scope.chosen = { prompt: $scope.options[$scope.choice], placeholder: $scope.placeholders[$scope.choice], font: $scope.fonts[$scope.fontChoice] }

   $scope.selectPrompt = ->
      $scope.choice = Math.floor(Math.random()*4)
      $scope.chosen = {prompt: $scope.options[$scope.choice], placeholder: $scope.placeholders[$scope.choice]}

   $scope.selectFont = ->
      $scope.fontChoice = Math.floor(Math.random()* 7)
      $scope.chosen = {prompt: $scope.options[$scope.choice], placeholder: $scope.placeholders[$scope.choice], font: $scope.fonts[$scope.fontChoice]}
      $scope.newPost.font = $scope.chosenFont

   $scope.initializeNewPost = ->
      $scope.selectPrompt()
      $scope.chosenColor = '#f3f2f2'
      $scope.newPost = { isNew: true, prepend: $scope.chosen.prompt }
      $scope.selectFont() 
      $scope.posts.unshift $scope.newPost

   $scope.$watch "chosen", ->
      $scope.newPost.prepend = $scope.chosen.prompt
      console.log $scope.chosen.font
      $scope.newPost.font = $scope.chosen.font
      


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
