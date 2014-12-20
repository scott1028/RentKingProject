# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app.controller 'Reply', ($scope, $rootScope, $cookieStore, $http)->
    $scope.init = (item_id)->
        $scope.item_id = item_id
        $scope.getReplies({id: $scope.item_id})
        console.info 'Reply Ctrl Init'

    $scope.getReplies = (params)->
        $http.get('/replies.json', {
            params: params
        }).success (data, status)->
            console.log data, status
            $scope.replies = data
        .error (data, status)->
            console.log data, status

    $scope.deleteReply = (id)->
        $http.delete('/replies/' + id + '.json')
        .success (data, status)->
            console.log data, status
            # $scope.replies = data
        .error (data, status)->
            console.log data, status
    $scope.updateReply = (id, data)->
        $http.put('/replies/')
        .success (data, status)->
            console.log data, status
            # $scope.replies = data
        .error (data, status)->
            console.log data, status
    $scope.createReply = (data)->
        $http.post('/replies/')
        .success (data, status)->
            console.log data, status
            # $scope.replies = data
        .error (data, status)->
            console.log data, status
    $scope.item_id = null
    $scope.replies = []
    
    # token = $('meta[name="csrf-token"]').attr('content')
    # $.ajaxPrefilter((options, originalOptions, xhr)->
    #     xhr.setRequestHeader('X-CSRF-Token', token)
    # )
    # debugger