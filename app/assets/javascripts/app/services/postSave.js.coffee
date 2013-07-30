@inspire.factory('Post', ($resource) ->
   return $resource('/api/v1/posts/:id', {id: '@id'})
)