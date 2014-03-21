controllers.controller 'LeftSideMenuCtrl', ($scope, $http, $location, storage)->
  storage.bind($scope, 'settings', {defaultValue: {url: 'http://localhost:3000'}})
  storage.bind($scope, 'token')
  $scope.logout = ->
    $http.delete(
      "#{$scope.settings.url}/tokens?token=#{$scope.token}"
    ).success((data) ->
      $scope.token = null
      $location.path('app/sign_in').replace()
    ).error((data) ->
      alert(data.message)
      $scope.token = null
      $location.path('app/sign_in').replace()
    )
