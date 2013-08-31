angular.module('BucketList').directive 'rating', ->
  restrict: 'E'
  # restrict: 'A'
  template: """
    <div class="rating">
      <div ng-click="up()">UP</div>
      {{ratingValue}}
      <div ng-click="down()">Down</div>
    </div>
    """
  scope:
    ratingValue: '='
    onRatingChanged: '&'
  link: (scope, elem, attrs)->
    scope.up = ->
      scope.ratingValue += 1
      scope.onRatingChanged()
    scope.down = ->
      scope.ratingValue -= 1
      scope.onRatingChanged()

    scope.stars = []
    for n in [1..scope.ratingValue]
      scope.stars.push({})
