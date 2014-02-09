Set = require '../../lib/Film/Set'
El = require 'stupid-dom-interface'

module.exports = class PanelsSet extends Set

	constructor: ->

		super

		@id = 'panels'

		bgImage = El '#panels-bg-image',

			inside: @film.display.bgLayer

			perspective: 900

		@_setupDomEl  'Panels - Background', 'Image', bgImage, [
			'opacity', 'rotation', 'translation'
		]