controllers.controller 'MyPageCtrl', ($scope, $rootScope, $location, $http, storage) ->
  $rootScope.token = storage.get("token")
  if ($rootScope.token)
    $scope.tapLeftButton = [{
      type: 'button button-clear',
      content: '<i class="icon ion-navicon-round"></i>',
      tap: (e) ->
        $scope.sideMenuController.toggleLeft()
        console.log 'Tap left button!'
    }]
#    $scope.tapRightButton = [{
#      type: 'button button-clear',
#      content: '<i class="icon ion-settings"></i>',
#      tap: (e) ->
#        console.log 'Tap right button!'
#    }]
  else
    storage.remove('token')
    $location.path('/').replace()
