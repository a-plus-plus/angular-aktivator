
angular.module('angularAktivatorApp').run ['$rootScope','Session', 'messageService',($rootScope,Session, messageService) ->
  $rootScope.$on("$routeChangeStart", (event, next, current)->
    if next.requireLogin and !Session.isLogged()
      messageService.setResponseMsg({value:"You don't have authorization to do that!", type:"error"})
      next.templateUrl = 'views/404.html'

  )
]