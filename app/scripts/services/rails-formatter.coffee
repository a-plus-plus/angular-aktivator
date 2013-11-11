'use strict'

angular.module('angularAktivatorApp')
  .service 'RailsFormatter', () ->
    # AngularJS will instantiate a singleton by calling "new" on this function
   prepare = (obj) ->
		ret = angular.copy(obj)
		angular.forEach(ret, (value,key) ->
			if angular.isArray(value)
				ret[key] = undefined
				ret[key+'_attributes'] = prepareArray(value)
		)
		ret
	prepareArray = (obj) ->
    	ret = {}
    	angular.forEach(obj, (value,key) ->
    		ret[key]=prepare(value)
    	)
    	ret
    {
    	prepare:prepare	
    }
