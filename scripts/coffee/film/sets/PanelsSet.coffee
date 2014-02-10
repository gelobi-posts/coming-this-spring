Set = require '../../lib/Film/Set'
El = require 'stupid-dom-interface'

module.exports = class PanelsSet extends Set

	constructor: ->

		super

		@id = 'panels'

		bgImage = El '#panels-bg-image',

			perspective: 900

		@_setupDomEl  'Panels - Background', 'Image', bgImage, [
			'opacity', 'rotation', 'translation'
		]

		@film.theatre.pieceBoundriesEventController.defineType 'panels',

			fn: (forward, last, supposedT, currentT, args) =>

				if forward

					bgImage.inside @film.display.bgLayer

				else

					bgImage.detach()

				return

		@film.theatre.pieceBoundriesEventController.events.add 'panels', 4001