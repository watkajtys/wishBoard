@inspire.controller "PostsController", ($scope, Post, $http) ->

   $scope.options = ['I wish', 'I want', 'I miss', 'I love']
   $scope.placeholders = ['upon a star...', 'to travel the world!', 'swinging!', 'thunderstorms!']
   $scope.fonts = ['Coming Soon', 'Sue Ellen Francisco', 'Neucha', 'Schoolbell', 'Loved by the King', 'Annie Use Your Telescope']
   $scope.colors = [ {font: '#f3f2f2', background: '89,82,82'}, {font: '#f5989d', background: '152,245,240'}, {font: '#fff799', background: '153,161,255'}, {font: '#bd8cbf', background: '191,189,140'}, {font: '#fdbd89', background: '137,201,253'}, {font: '#79bcde', background: '222,155,121'}, {font: '#82ca89', background: '202,130,195'} ]
   $scope.searchFilter = '';
   $scope.fontColorChoice = $scope.colors[0].font
   $scope.backgroundColorChoice = $scope.colors[0].background

   
   $scope.headerHide = false
   $scope.headerToggle = (headerHide) ->
      $scope.headerHide = !headerHide

   $scope.footerShow = false
   $scope.footerToggle = (footerShow) ->
      $scope.footerShow = !footerShow
      console.log $scope.footerShow

   $scope.pickColor = (color) ->
      $scope.fontColorChoice = color.font
      $scope.backgroundColorChoice = color.background
      $scope.chosen = { prompt: $scope.options[$scope.choice], placeholder: $scope.placeholders[$scope.choice], font: $scope.fonts[$scope.fontChoice], color: $scope.fontColorChoice, background: $scope.backgroundColorChoice }

   $scope.iterateFont = (math) -> 
      max = $scope.fonts.length - 1
      if math == 'up'
         $scope.fontChoice = $scope.fontChoice + 1
         $scope.fontChoice = 0 if $scope.fontChoice > max
      else
         $scope.fontChoice = $scope.fontChoice - 1
         $scope.fontChoice = 0 if $scope.fontChoice > max
         $scope.fontChoice = max if $scope.fontChoice < 0
      $scope.chosen = { prompt: $scope.options[$scope.choice], placeholder: $scope.placeholders[$scope.choice], font: $scope.fonts[$scope.fontChoice], color: $scope.fontColorChoice, background: $scope.backgroundColorChoice }

   $scope.iteratePrompt = (math) ->
      max = $scope.options.length - 1
      if math == 'up'
         $scope.choice = $scope.choice + 1
         $scope.choice = 0 if $scope.choice > max
      else
         $scope.choice = $scope.choice - 1
         $scope.choice = 0 if $scope.choice > max
         $scope.choice = max if $scope.choice < 0
      $scope.chosen = { prompt: $scope.options[$scope.choice], placeholder: $scope.placeholders[$scope.choice], font: $scope.fonts[$scope.fontChoice], color: $scope.fontColorChoice, background: $scope.backgroundColorChoice }

   $scope.selectPrompt = ->
      $scope.choice = Math.floor(Math.random()*4)
      $scope.chosen = { prompt: $scope.options[$scope.choice], placeholder: $scope.placeholders[$scope.choice], color: $scope.fontColorChoice, background: $scope.backgroundColorChoice}

   $scope.selectFont = ->
      $scope.fontChoice = Math.floor(Math.random()* 6)
      $scope.chosen = { prompt: $scope.options[$scope.choice], placeholder: $scope.placeholders[$scope.choice], font: $scope.fonts[$scope.fontChoice], color: $scope.fontColorChoice, background: $scope.backgroundColorChoice }

   $scope.initializeNewPost = ->
      $scope.selectPrompt()
      $scope.selectFont()
      $scope.newPost = { isNew: true, prepend: $scope.chosen.prompt }
      $scope.posts.unshift $scope.newPost

   $scope.$watch "chosen", ->
      $scope.newPost.prepend = $scope.chosen.prompt
      $scope.newPost.font = $scope.chosen.font
      $scope.newPost.color = $scope.chosen.color
      $scope.newPost.background = $scope.chosen.background
      
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

   $scope.savePost = ->
      console.log $scope.newPost
      Post.save $scope.newPost,
         (data) ->
            # $scope.posts.unshift $scope.newPost # appending
            $scope.newPost.isNew = false
            console.log data
            $scope.initializeNewPost()
         (response) ->
            $scope.errors = response.data.errors
            console.log($scope.errors)

   $scope.initializeNewPost()
   $scope.nextPage()
