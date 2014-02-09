AirBox = require '../tools/AirBox'
El = require 'stupid-dom-interface'

module.exports = class Display

	constructor: (@film, @aspectRatio = 1.85) ->

		ab = new AirBox @aspectRatio

		@el = El '#display'
		.inside document.body

		@viewEl = El '#view'
		.inside display
		.width ab.width
		.height ab.height

		@stageLayerEl = El '#stageLayer'
		.inside @viewEl

		@bgLayer = El '#bgLayer'
		.inside @viewEl

		@stageEl = El '#stage'
		.set 'width', ab.width
		.set 'height', ab.height
		.perspective 800
		.inside @stageLayerEl

		ab.on 'transform-change', =>

			@viewEl
			.scale ab.scale
			.x ab.x
			.y ab.y

			return