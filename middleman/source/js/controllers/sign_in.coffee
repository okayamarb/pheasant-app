controllers.controller 'SignInCtrl', ($scope, $rootScope, $http, $location, $ionicModal, storage) ->
  # 最初からやり直したい場合はコメントアウトしてください
  # storage.remove("token")
  # URLも初期化したい場合はこちら
#  storage.clearAll()
#  $scope.user.email = "admin@email.com"
#  $scope.user.password = 'password'
  $scope.user = {
    email: 'admin@email.com',
    password: 'password'
  }
  $rootScope.token = storage.get("token")
  if ($rootScope.token)
    $location.path('/my_page').replace()
  else
    storage.bind($scope, 'settings', {defaultValue: {url: 'http://localhost:3000'}})
    $scope.tapLeftButton = (e) ->
      console.log 'Tap left button!'
    $scope.tapRightButton = (e) ->
      console.log 'Tap right button!'
      $scope.showSettings()
    $scope.closeModal = (e) ->
      $scope.modal.hide()


    $ionicModal.fromTemplateUrl('views/pheasant_settings.html',
      (modal) ->
        $scope.modal = modal
      ,
      {scope: $scope, animation: 'slide-in-up'}
    )

    $scope.showSettings = ->
      $scope.modal.show()

    #  Be sure to cleanup the modal
    $scope.$on '$destroy', ->
      $scope.modal.remove()

    $scope.signIn = ->
      $http.post(
        "#{$scope.settings.url}/tokens",
        this.user
      ).success((data)->
        storage.set('token', data.token)
        $rootScope.token = storage.get("token")
        $location.path('/my_page').replace()
      ).error((data) ->
        alert(data.message)
      )
