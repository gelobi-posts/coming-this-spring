Emitter = require 'utila/scripts/js/lib/Emitter'

module.exports = class AirBox extends Emitter

	constructor: (@ratio) ->

		super

		@width = 0
		@height = 0

		@scale = 1
		@x = 0
		@y = 0

		do @_calculateDims

		window.addEventListener 'resize', @_recalculateTransform

		setTimeout @_recalculateTransform, 0

	_calculateDims: ->

		{width, height} = window.screen

		screenRatio = width / height

		if @ratio >= screenRatio

			@width = width
			@height = width / @ratio

		else

			@height = height
			@width = @height * @ratio

	_recalculateTransform: =>

		{innerWidth, innerHeight} = window

		wScale = innerWidth / @width

		hScale = innerHeight / @height

		scale = Math.min wScale, hScale

		@scale = scale

		@x = (innerWidth - @width) / 2.0
		@y = (innerHeight - @height) / 2.0

		@_emit 'transform-change'