angular.module('BucketList').directive 'speechBubble', [
  ->
    restrict: 'E'
    scope: {
    }
    template: """
      <p class="SPEECH-BUBBLE" ng-transclude>
        <audio preload="auto" ng-src="{{audio}}"></audio>
      </p>
    """
    replace: true
    transclude: true
    link: (scope, linkElement, attr)->
      linkElement.css('width',  attr.w + 'px')
      linkElement.css('left',   attr.l + 'px')
      linkElement.css('bottom', attr.b + 'px')
      audio = $(linkElement).find('audio').get(0)
      audio.addEventListener 'ended', ->
        # TODO: This is not working on the iPad. Prevents playing back audio more than once.
        audio.currentTime = 0;
      $(linkElement).click ->
        audio.play()

      linkElement.css("width",  attr.bubblew + "px")
      linkElement.css("height", attr.bubbleh + "px")
      linkElement.css("left",   attr.bubblel + "px")
      linkElement.css("top",    attr.bubblet + "px")
      attr.tailh = Number(attr.tailh)
      attr.taill = Number(attr.taill)
      linkElement.append """
        <style>
          .SPEECH-BUBBLE:after{
            bottom:#{(-(attr.tailh * 1.47))}px;
            left:#{attr.taill}px;
            border-width:#{attr.tailh}px #{attr.tailh / 3.33}px;
          }
          .SPEECH-BUBBLE:before{
            bottom: #{-(attr.tailh * 1.40)}px;
            left:   #{attr.taill+ attr.tailh * .16}px;
            border-width: #{attr.tailh - (attr.tailh * .32)}px #{(attr.tailh - (attr.tailh * .1)) / 3.33}px
          }
        </style>
        """
]