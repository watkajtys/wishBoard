@inspire = angular.module('inspire', ['ngResource'])

@inspire.config(($routeProvider, $locationProvider) ->
   $locationProvider.html5Mode(true)

   $routeProvider
      .when("/", {templateUrl: "posts/board", controller: "PostsController"})
      .otherwise({templateUrl: "Page not found. Something got fucked up."})
)

@inspire.run(['$window', '$templateCache', ($window, $templateCache) -> 
   $templateCache.put(name, templateFunction) for name, templateFunction of $window.JST
])