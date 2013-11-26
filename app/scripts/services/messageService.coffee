'use strict'

angular.module('angularAktivatorApp')
  .service 'messageService', ['$timeout',($timeout) ->

    messages = []

    getMessages = () ->
        messages

    setResponseMsg = (msg) ->
        messages.push msg
        $timeout ->
          messages.shift()
        ,5000


    {
        getMessages:getMessages
        setResponseMsg:setResponseMsg
    }
]
