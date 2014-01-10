'use strict'

angular.module('angularAktivatorApp')
  .service 'RailsFormatter', [() ->
    transformNested = (obj,keys,deep) ->
      angular.forEach keys, (key,i) ->
        if obj[key] and angular.isArray obj[key]
          arr = obj[key]
          delete obj[key]
          obj[key+'_attributes'] = arr
      if deep and (angular.isObject obj or angular.isArray obj)
        angular.forEach obj, (value, key) ->
          transformNested value, keys, deep

    transformIds = (obj, keys, id) ->
      angular.forEach keys, (key,i) ->
        substr = key.substring(0,key.length-1)
        if obj[key] and angular.isArray obj[key]
          arr = obj[key]
          if id then extract(arr, id)
          delete obj[key]
          obj[substr+'_ids'] = arr
      if angular.isObject obj or angular.isArray obj
        angular.forEach obj, (value, key) ->
          transformIds value, keys

    extract = (arr, id) ->
      angular.forEach arr, (elem, index) ->
        arr[index] = elem[id]

    {
      transformNested:transformNested
      transformIds:transformIds
    }
]
