'use strict'

angular.module('angularAktivatorApp')
.factory 'Survey', ['$resource','RailsFormatter',($resource, RailsFormatter) ->

  transform = (data, headersGetter)->
    survey = angular.copy data
    RailsFormatter.transformNested(survey, ['questions','options'], true)
    RailsFormatter.transformIds(survey, ['tags'], 'id')
    console.log survey
    JSON.stringify {survey:survey}

  $resource 'http://localhost\\:3000/surveys/:id', id: '@id', {
    'save':     {method:'POST', transformRequest:transform}
    'update': {method:'PUT', transformRequest:transform}
  }


]
