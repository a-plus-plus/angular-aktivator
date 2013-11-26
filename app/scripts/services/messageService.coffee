'use strict'

angular.module('angularAktivatorApp')
  .service 'messageService', () ->

    responseMsg = {}

    getResponseMsg = () ->
        responseMsg

    setResponseMsg = (msg) ->
        responseMsg = msg


    {
        getResponseMsg:getResponseMsg
        setResponseMsg:setResponseMsg
    }   
    # Not in use currently, was supposed to be used by answer.coffee, but injecting won't work for some reason
