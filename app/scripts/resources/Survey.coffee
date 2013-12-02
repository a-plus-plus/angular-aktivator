'use strict'

angular.module('angularAktivatorApp')
.factory 'Survey', ['$resource','RailsFormatter',($resource, RailsFormatter) ->

  transform = (data, headersGetter)->
    survey = angular.copy data
    #console.log 'before', angular.copy survey
    RailsFormatter.transformNested(survey, ['questions','options'], true)
    RailsFormatter.transformIds(survey, ['tags'], 'id')
    #console.log 'after', angular.copy survey
    JSON.stringify {survey:survey}

  $resource 'http://localhost\\:3000/surveys/:id', id: '@id', {
    'save':     {method:'POST', transformRequest:transform}
    'update': {method:'PUT', transformRequest:transform}
  }


]
