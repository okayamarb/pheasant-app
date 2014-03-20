app_name = 'Pheasant'
window.app = angular.module(app_name, ['ionic', 'ngSanitize', 'ngResource', 'angularLocalStorage', "#{app_name}.controllers"])
window.app.config(
  ($stateProvider, $urlRouterProvider, $httpProvider) ->
    $stateProvider.state('top', {
      url: '/',
      templateUrl: 'views/top.html',
      controller: 'TopCtrl'
    })
    $urlRouterProvider.otherwise('/')
    $httpProvider.defaults.transformRequest = (data) ->
      if (data == undefined)
        return data
      return $.param(data)
    $httpProvider.defaults.headers.post = {
      'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
    }
    $httpProvider.defaults.useXDomain = true
#    delete $httpProvider.defaults.headers.common['X-Requested-With']
##    $httpProvider.defaults.headers.common = {Accept: "application/json, text/plain, */*"}
#    $httpProvider.defaults.headers.post = {"Content-Type": "application/json;charset=utf-8"}
)
window.controllers = angular.module("#{app_name}.controllers", [])
ionic.Platform.ready ->
  console.log(ionic.Platform.device().platform)