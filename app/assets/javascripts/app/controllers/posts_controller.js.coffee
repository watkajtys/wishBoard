@inspire.controller("PostsController", ($scope, Post) ->
   $scope.posts = Post.query()
)