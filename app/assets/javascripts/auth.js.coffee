'use strict'

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app.controller 'Login', ($scope)->
    $scope.login= ->
      FB.login (response)->
        if response.authResponse
          console.log "Welcome!  Fetching your information.... "
          FB.api "/me", (response) ->
            console.log "Good to see you, " + response.name + "."
            $.post "/auth/check_access_token/", FB.getAuthResponse(), (r, i, a) ->
              console.log r
              location.reload()
              return
            return
        else
          console.log "User cancelled login or did not fully authorize."

    $scope.logout= ->
      $.get "/auth/logout/", (r, i, a) ->
        # FB.logout (response) ->
        #   user is now logged out
        console.log r
        location.reload()
        return

    console.info 'Login Ctrl Init'
