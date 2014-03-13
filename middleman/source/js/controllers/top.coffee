controllers.controller 'TopCtrl', ($scope) ->
  $scope.title = 'SampleApp'
  $scope.tapLeftButton = [{
    type: 'button button-clear',
    content: '<i class="icon ion-android-remove"></i>',
    tap: (e) ->
      console.log 'Tap left button!'
  }]

  $scope.tapRightButton = [{
    type: 'button button-clear',
    content: '<i class="icon ion-android-add"></i>',
    tap: (e) ->
      console.log 'Tap right button!'
  }]
