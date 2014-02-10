Set = require '../../lib/Film/Set'
El = require 'stupid-dom-interface'

module.exports = class HiThereSet extends Set

	constructor: ->

		super

		@id = 'hiThere'

		container = El '#hiThere-container.container'
		.inside @film.display.stageEl

		gelobiInGrotesk = El '#hiThere-gelobiInGrotesk'
		.inside container

		@_setupDomEl 'Hi there', 'Gelobi in Grotesk', gelobiInGrotesk, [
			'translation', 'opacity'
		]

		webArtTech = El '#hiThere-webArtTech'
		.inside container

		@_setupDomEl 'Hi there', 'Web, Art, Tech', webArtTech, [
			'translation', 'opacity'
		]

		cover = El '#hiThere-cover'
		.inside container

		@_setupDomEl 'Hi there', 'Cover', cover, [
			'translation', 'scale'
		]

		@film.theatre.pieceBoundriesEventController.defineType 'hiThere',

			fn: (forward, last, supposedT, currentT, args) ->

				if forward then container.detach() else container.inside stage

				return

		@film.theatre.pieceBoundriesEventController.events.add 'hiThere', 4000