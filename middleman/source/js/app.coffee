app_name = 'SampleApp'
window.app = angular.module(app_name, ['ionic', 'ngSanitize', 'ngResource', "#{app_name}.controllers"])
window.app.config(
  ($stateProvider, $urlRouterProvider) ->
    $stateProvider.state('top', {
      url: '/',
      templateUrl: 'views/top.html',
      controller: 'TopCtrl'
    })
    $urlRouterProvider.otherwise('/')
)
window.controllers = angular.module("#{app_name}.controllers", [])
ionic.Platform.ready ->
  console.log(ionic.Platform.device().platform)