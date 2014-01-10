'use strict'

angular.module('angularAktivatorApp')
  .service 'messageService', ['$interval', ($interval) ->

    messages = []

    getMessages = () ->
      messages

    addMessage = (msg) ->
      messages.push msg
    $interval ->
      if messages.length
        messages.shift()
    ,5000


    {
      getMessages:getMessages
        setResponseMsg:addMessage
    }
  ]
