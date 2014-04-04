controllers.controller 'MyPageCtrl', ($scope, $rootScope, $location, $http, $state, storage) ->
  $scope.token = storage.get("token")

  $scope.removeToken = ->
    storage.remove('token')
    $location.path('/').replace()

  if ($scope.token)
    $scope.tapLeftButton = (e) ->
      $scope.logout()

    $scope.isAdmin = ->
      true
  else
    $scope.removeToken()

  $scope.logout = ->
    storage.bind($scope, 'settings', {defaultValue: {url: 'http://localhost:3000'}})
    $http.delete(
      "#{$scope.settings.url}/tokens?token=#{$scope.token}"
    ).success((data) ->
      $scope.removeToken()
    ).error((data) ->
      alert(data.message)
      $scope.removeToken()
    )

