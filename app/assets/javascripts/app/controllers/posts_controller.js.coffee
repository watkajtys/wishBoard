@inspire.controller("PostsController", ($scope, postService) ->
   
   postService.async().then (data) ->
      $scope.posts = data

   $scope.savePost = ->
      Post.save($scope.newPost,
         (data) ->
            console.log('success')
         ,(response) ->
            $scope.errors = response.data.errors
            console.log($scope.errors)
         ) 
)