angular.module('BucketList').factory 'ToDo', ($resource)->
  $resource('/api/todos/:id', {id: '@id'}, {'update': {method: 'PUT'}})
