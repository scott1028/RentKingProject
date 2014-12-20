# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app.controller 'Reply', ($scope, $rootScope, $cookieStore, $http)->
    $scope.getReplies= ->   
    # console.log $rootScope
    console.info 'Reply Ctrl Init'
    $http.get('/replies.json', {
        params: {id: item_id}
    }).success (data, status)->
        console.log data, status
    .error (data, status)->
        console.log data, status
    # debugger