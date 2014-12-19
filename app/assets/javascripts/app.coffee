'use strict'


@app = angular.module('Main', ['ngCookies']).run [
  "$rootScope"
  "$location"
  ->
    window.fbAsyncInit = ->
      FB.init({
        appId      : '355259171265354',
        xfbml      : true,
        version    : 'v2.1'
      });

    ((d, s, id)->
       js
       fjs = d.getElementsByTagName(s)[0];
       return if d.getElementById(id)
       js = d.createElement(s)
       js.id = id
       js.src = "//connect.facebook.net/en_US/sdk.js"
       fjs.parentNode.insertBefore(js, fjs)
    )(document, 'script', 'facebook-jssdk');
    console.log 'wellcome!'
  ]
  # test controller
  .controller('test', ($scope)->
    $scope.click = ->
      console.log 123

    $scope.logout = ->
      console.log 456
  )
