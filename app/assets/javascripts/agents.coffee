# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  Paloma.controller 'Agents', new: ->    
    $(".btn-add-agent").click (e) ->
      $("#agent_form").validate
        rules:
          'user[name]':
            required: true
          
          'user[email]':
            required: true
            email: true

          'user[password]':
            required: true

        messages:
          'user[name]':
            required: 'Name is required.'
          
          'user[email]':
            required: 'Email is required.'

          'user[password]':
            required: 'Password is required.'
