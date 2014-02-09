Set = require '../../lib/Film/Set'
El = require 'stupid-dom-interface'

module.exports = class HiThereSet extends Set

	constructor: ->

		super

		@id = 'hiThere'

		container = El '#hiThere-container.container'
		.inside stage

		gelobiInGrotesk = El '#hiThere-gelobiInGrotesk'
		.inside container

		@_setupDomEl 'Hi there', 'Gelobi in Grotesk', gelobiInGrotesk, [
			'translation', 'opacity'
		]

		cover = El '#hiThere-cover'
		.inside container

		@_setupDomEl 'Hi there', 'Cover', cover, [
			'translation', 'scale'
		]