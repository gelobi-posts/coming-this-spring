Foxie = require 'Foxie'

module.exports = class AwesomeType

	constructor: (@parent) ->

		@spans = []
		@foxies = []
		@sizes = []

		@createCaret()

	createCaret: ->

		@caretFoxie = Foxie('.fi-holder')
		.putIn(@parent)
		.moveXTo(0)
		.setOpacity(0)

		@caret = document.createElement 'b'
		@caret.innerHTML = '&#8203;'
		@caret.classList.add 'fi-holder-caret'
		@caretFoxie.node.appendChild @caret


	createSpan: (char) ->

		span = document.createElement 'span'
		span.classList.add 'fi-span'
		span.innerHTML = char
		@parent.appendChild span

		@foxies.push Foxie(span)
		.moveZTo(20)
		.moveXTo(20)
		.setOpacity(0)

		@spans.push span
		@sizes.push span.getBoundingClientRect().width

	createText: (text) ->

		for i in [0...text.length]

			@createSpan text[i]

	get: ->

		return 0

	showCaret: (pos) ->

		@caretFoxie
		.setOpacity(1)
		.moveXTo(pos)

	hideCaret: ->

		@caretFoxie
		.setOpacity(0)

	showSpans: (from, to) ->

		for j in [from...to]

			@foxies[j]
			.moveXTo(0)
			.setOpacity(1)

	hideSpans: (from, to) ->

		for j in [from...to]

			@foxies[j]
			.moveXTo(20)
			.setOpacity(0)

	animateAt: (time) =>

		if -0.2 <= time <= 0

			@hideSpans 0, @foxies.length
			@showCaret 0

			return

		if time < -0.2

			@hideSpans 0, @foxies.length
			do @hideCaret

			return

		if time > 1

			do @hideCaret
			@showSpans 0, @foxies.length

			return

		if time > 0 and time < 1

			click = 1 / @spans.length

			i = Math.floor((time / click) + 0.00001)

			@hideSpans i, @foxies.length

			@showSpans 0, i

			deltaX = -20

			coeff = time % click / click

			@foxies[i]
			.moveXTo(20 + deltaX * coeff)
			.setOpacity(coeff)

			totalSize = 0

			for j in [0..i]

				totalSize += (@sizes[j] + 1)

			@showCaret(totalSize)

		return
