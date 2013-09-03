angular.module('BucketList').factory 'ToDo', [
  '$resource', ($resource)->
    $resource('/api/todos/:id', {id: '@id'}, {'update': {method: 'PUT'}})
]