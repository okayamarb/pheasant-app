app_name = 'Pheasant'
window.app = angular.module(app_name, ['ionic', 'ngSanitize', 'ngResource', 'angularLocalStorage', "#{app_name}.controllers"])
window.app.config(
  ($stateProvider, $urlRouterProvider, $httpProvider) ->
    $stateProvider.state('sign_in', {
      url: '/',
      templateUrl: 'views/sign_in.html',
      controller: 'SignInCtrl'
    }).state('my_page', {
      url: '/my_page',
      templateUrl: 'views/my_page.html',
      controller: 'MyPageCtrl'
    }).state('users', {
      url: '/users',
      templateUrl: 'views/users/index.html',
      controller: 'UsersCtrl'
    })
    $urlRouterProvider.otherwise('/')
    $httpProvider.defaults.useXDomain = true
    $httpProvider.defaults.withCredentials = true
    delete $httpProvider.defaults.headers.common['X-Requested-With']
    return
)
window.controllers = angular.module("#{app_name}.controllers", [])
ionic.Platform.ready ->
  console.log(ionic.Platform.device().platform)