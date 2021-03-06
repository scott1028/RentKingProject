# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app.controller 'Reply', ($scope, $rootScope, $cookieStore, $http)->
    $scope.init = (item_id)->
        $scope.item_id = item_id
        $scope.current_obj = {
            message: null,
            item_id: $scope.item_id
        }
        $scope.getReplies({item_id: $scope.item_id})
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
            $scope.getReplies {item_id: $scope.item_id}
            # $scope.replies = data
        .error (data, status)->
            console.log data, status

    $scope.updateReply = (id, data)->
        $http.put('/replies/' + id + '.json', data)
        .success (data, status)->
            console.log data, status
            $scope.getReplies {item_id: $scope.item_id}
            # $scope.replies = data
        .error (data, status)->
            console.log data, status

    $scope.createReply = (data)->
        $http.post('/replies/', data)
        .success (data, status)->
            console.log data, status
            $scope.getReplies {item_id: $scope.item_id}
            $scope.current_obj.message = null;
            # $scope.replies = data
        .error (data, status)->
            console.log data, status
    #
    $scope.item_id = null
    $scope.current_obj = {};
    $scope.replies = []
