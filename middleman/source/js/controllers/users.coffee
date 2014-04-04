controllers.controller 'UsersCtrl', ($scope, $location, $http, storage, $resource) ->
  $scope.token = storage.get("token")
  storage.bind($scope, 'settings', {defaultValue: {url: 'http://localhost:3000'}})
#  if ($scope.token)
  $scope.tapLeftButton = (e) ->
    console.log("test")
#    $scope.tapLeftButton = [{
#      type: 'button button-clear',
#      content: '<i class="icon ion-navicon-round"></i>',
#      tap: (e) ->
##        $scope.sideMenuController.toggleLeft()
#        console.log 'Tap left button!'
#        $scope.logout()
#    }]
##    $scope.tapRightButton = [{
##      type: 'button button-clear',
##      content: '<i class="icon ion-settings"></i>',
##      tap: (e) ->
##        console.log 'Tap right button!'
##    }]
#
#    $scope.isAdmin = ->
#      true
#
#    User = $resource("#{$scope.settings.url}/users", {token: $scope.token})
#    $scope.users = User.query()
#
#  else
#    storage.remove('token')
#    $location.path('/').replace()
