app_name = 'Pheasant'
window.app = angular.module(app_name, ['ionic', 'ngSanitize', 'ngResource', 'angularLocalStorage', "#{app_name}.controllers"])
window.app.config(
  ($stateProvider, $urlRouterProvider, $httpProvider) ->
    $stateProvider.state('app', {
      url: '/app',
      abstract: true,
      templateUrl: 'views/container.html'
    }).state('app.sign_in', {
      url: '/sign_in',
      views: {
        'mainContent': {
          templateUrl: 'views/sign_in.html',
          controller: 'SignInCtrl'
        }
      }
    }).state('app.my_page', {
      url: '/my_page',
      views: {
        'mainContent': {
          templateUrl: 'views/my_page.html',
          controller: 'MyPageCtrl'
        },
        'sideLeft': {
          templateUrl: 'views/left_side_menu.html',
          controller: 'LeftSideMenuCtrl'
        }
      }
    })
    $urlRouterProvider.otherwise('/app/sign_in')
    $httpProvider.defaults.useXDomain = true
    $httpProvider.defaults.withCredentials = true
)
window.controllers = angular.module("#{app_name}.controllers", [])
ionic.Platform.ready ->
  console.log(ionic.Platform.device().platform)