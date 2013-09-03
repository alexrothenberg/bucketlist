angular.module('BucketList').directive 'countdown', [
  '$timeout', ($timeout)->
    restrict: 'E'
    template: """
      <div class="countdown">
        <span class="days   ">{{
          countdown.days
        }}</span>:<span class="hours  ">{{
          countdown.hours
        }}</span>:<span class="minutes">{{
          countdown.minutes
        }}</span>:<span class="seconds">{{
          countdown.seconds
        }}</span>
      </div>
      """
    scope:
      dateinmillis: '='
    link: (scope, elem, attrs)->
      updateCountdown = ->
        today = new Date().getTime()
        date = new Date(scope.dateinmillis)
        secondsTilDate = (date - today) / 1000
        scope.countdown =
          days:    Math.floor(secondsTilDate / 86400)
          hours:   Math.floor(secondsTilDate / 3600) % 24
          minutes: Math.floor(secondsTilDate / 60)   % 60
          seconds: Math.floor(secondsTilDate / 1)    % 60
        $timeout(updateCountdown, 1000)

      updateCountdown()
]