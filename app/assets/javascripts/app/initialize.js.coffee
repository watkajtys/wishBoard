@inspire = angular.module('inspire', ['ngResource'])

@inspire.directive "whenScrolled", ->
   (scope, elm, attr) ->
      raw = elm[0]
      elm.bind "scroll", ->
         scope.$apply attr.whenScrolled  if raw.scrollTop + raw.offsetHeight >= (raw.scrollHeight - 400)

@inspire.config(($routeProvider, $locationProvider) ->
   $locationProvider.html5Mode(true)

   $routeProvider
      .when("/", {templateUrl: "posts/board", controller: "PostsController"})
      .otherwise({templateUrl: "Page not found. Something got fucked up."})
)

@inspire.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest"
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
]

@inspire.run(['$window', '$templateCache', ($window, $templateCache) -> 
   $templateCache.put(name, templateFunction) for name, templateFunction of $window.JST
])