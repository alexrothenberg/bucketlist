angular.module('BucketList').directive 'countdown', [
  '$timeout', ($timeout)->
    restrict: 'E'
    template: """
      <span class="countdown">
        <span class="days   ">{{
          countdown.days
        }}</span> days
        <span class="clock">
          <span class="hours  ">{{
            countdown.hours
          }}</span>:<span class="minutes">{{
            countdown.minutes
          }}</span>:<span class="seconds">{{
            countdown.seconds
          }}</span>
        </span>
      </span>
      """
    scope:
      dateinmillis: '='
    link: (scope, elem, attrs)->
      updateCountdown = ->
        today = new Date().getTime()
        date = new Date(scope.dateinmillis)
        secondsTilDate = (date - today) / 1000
        days    = Math.floor(secondsTilDate / 86400)
        hours   = Math.floor(secondsTilDate / 3600) % 24
        minutes = Math.floor(secondsTilDate / 60)   % 60
        seconds = Math.floor(secondsTilDate / 1)    % 60

        # leading zeros
        hours   = "0#{hours}"   if hours   < 10
        minutes = "0#{minutes}" if minutes < 10
        seconds = "0#{seconds}" if seconds < 10

        scope.countdown =
          days:    days
          hours:   hours
          minutes: minutes
          seconds: seconds
        $timeout(updateCountdown, 1000)

      updateCountdown()
]