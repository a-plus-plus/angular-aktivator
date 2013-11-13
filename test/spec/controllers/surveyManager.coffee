'use strict'

describe 'Controller: SurveymanagerCtrl', () ->

  # load the controller's module
  beforeEach module 'angularAktivatorApp'

  SurveymanagerCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    SurveymanagerCtrl = $controller 'SurveyManagerCtrl', {
      $scope: scope
    }

  
