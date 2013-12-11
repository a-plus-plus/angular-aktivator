'use strict'

angular.module('angularAktivatorApp')
.factory 'Survey', ['$resource','RailsFormatter','databaseUrl',($resource, RailsFormatter,databaseUrl) ->

  transform = (data, headersGetter)->
    survey = angular.copy data
    #console.log 'before', angular.copy survey
    RailsFormatter.transformNested(survey, ['questions','options'], true)
    RailsFormatter.transformIds(survey, ['tags'], 'id')
    #console.log 'after', angular.copy survey
    angular.toJson {survey:survey}

  $resource databaseUrl+'/surveys/:id', id: '@id', {
    'save':     {method:'POST', transformRequest:transform}
    'update': {method:'PUT', transformRequest:transform}
  }


]
