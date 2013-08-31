angular.module('BucketList').controller 'ToDosController', ($scope, ToDo, $location, $routeParams)->
  $scope.todos = ToDo.query()
  $scope.todo = ToDo.get(id: $routeParams.id) if $routeParams.id?

  $scope.new = ->
    $scope.todo = {}
    $location.path('/todos/new')

  $scope.edit = (todo)->
    $scope.todo = todo
    $location.path("/todos/#{todo.id}/edit")

  $scope.cancel = ->
    $location.path("/todos")

  $scope.update =  (todo)->
    # alert("Updated")
    todo.$update()
    $location.path("/todos")

  $scope.create = (todo)->
    alert("Created")
    $location.path("/todos")

