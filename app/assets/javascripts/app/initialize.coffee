@inspire = angular.module('inspire', [])

@inspire.config(($routeProvider, $locationProvider) ->
   $locationProvider.html5Mode(true)

   $routeProvider
      .when("/", {template: "images/board", controller: "PostsController"})
      .otherwise({template: "Page not found. Something got fucked up."})
)

@inspire.run(['$window', '$templateCache', ($window, $templateCache) -> 
   $templateCache.put(name, templateFunction) for name, templateFunction of $window.JST
])