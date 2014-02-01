Foxie = require 'Foxie'

module.exports = class AwesomePie

	constructor: (@svg, @x, @y, @radius, @start, @end, @options) ->

		do @_createPie

	_createPie: ->

		@svgPie = Foxie('svg:path')
		.putIn(@svg)

		for name, value of @options

			@svgPie.attr name, value

		@svgPie.attr('d', @_describeArc(@x, @y, @radius, @start, @start + @end))

	setEnd: (end) ->

		if typeof end is 'number'

			@end = end

			@svgPie.attr('d', @_describeArc(@x, @y, @radius, @start, @start + @end))

		else

			console.error 'AwesomePie: bad type of end', typeof end


	setStart: (start) ->

		if typeof start is 'number'

			@start = start

			@svgPie.attr('d', @_describeArc(@x, @y, @radius, @start, @start + @end))

		else

			console.error 'AwesomePie: bad type of start',  typeof start


	get: ->

		@svgPie

	_polarToCartesian: (centerX, centerY, radius, angleInDegrees) ->

		angleInRadians = (angleInDegrees - 90) * Math.PI / 180.0

		return {

			x: centerX + (radius * Math.cos(angleInRadians))

			y: centerY + (radius * Math.sin(angleInRadians))

		}

	_describeArc: (x, y, radius, startAngle, endAngle) ->

		start = @_polarToCartesian x, y, radius, endAngle

		end = @_polarToCartesian x, y, radius, startAngle


		arcSweep = (if endAngle - startAngle <= 180 then "0" else "1")

		["M", start.x, start.y, "A", radius, radius, 0, arcSweep, 0, end.x, end.y].join(" ")