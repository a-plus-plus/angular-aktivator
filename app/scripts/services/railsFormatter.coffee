'use strict'

angular.module('angularAktivatorApp')
  .service 'RailsFormatter', () ->
    transformNested = (obj,keys,deep) ->
        angular.forEach keys, (key,i) ->
            if obj[key] and angular.isArray obj[key]
                arr = obj[key]
                delete obj[key]
                obj[key+'_attributes'] = fakeArray(arr)
        if deep and (angular.isObject obj or angular.isArray obj)
            angular.forEach obj, (value, key) ->
                transformNested value, keys, deep

    fakeArray = (arr) ->
        ret = {}
        angular.forEach arr, (elem, i) ->
            ret[i]= elem
        ret

    transformIds = (obj, keys) ->
        angular.forEach keys, (key,i) ->
            substr = key.substring(0,key.length-1)
            if obj[key] and angular.isArray obj[key]
                arr = obj[key]
                delete obj[key]
                obj[substr+'_ids'] = arr
        if angular.isObject obj or angular.isArray obj
            angular.forEach obj, (value, key) ->
                transformIds value, keys

    {
        transformNested:transformNested
        transformIds:transformIds
    }
