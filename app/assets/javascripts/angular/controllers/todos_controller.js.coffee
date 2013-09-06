angular.module('BucketList').controller 'ToDosController', [
  '$scope', 'ToDo', '$location', '$routeParams', ($scope, ToDo, $location, $routeParams)->
    $scope.todos = ToDo.query()
    $scope.todo = ToDo.get(id: $routeParams.id) if $routeParams.id?

    $scope.endorse = (todo)->
      $scope.bubbleText = "Are you Mike?"
      $scope.bubbleShow = true

    $scope.new = ->
      $scope.todo = {}
      $location.path('/todos/new')

    $scope.edit = (todo)->
      $scope.todo = todo
      $location.path("/todos/#{todo.id}/edit")

    $scope.cancel = ->
      $location.path("/todos")

    $scope.update =  (todo)->
      todo.$update()
      $location.path("/todos")

    $scope.create = (todo)->
      todo.$save()
      $scope.todos = ToDo.query()
      $location.path("/todos")

    $scope.voteFor = (todo)->
      todo.rating += 1
      $scope.update(todo)

    $scope.addItem = ->
      todo = new ToDo({ title: $scope.newItem })
      $scope.create(todo)
]