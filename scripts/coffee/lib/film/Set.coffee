module.exports = class Set

	constructor: (@film, @id) ->

	_setupDomEl: ->

		@film._setupDomEl.apply @film, arguments