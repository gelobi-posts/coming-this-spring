Kilid = require 'kilid'
Film = require './Film'
EditingTheatre = require './editingFilm/EditingTheatre'

module.exports = class EditingFilm extends Film

	constructor: ->

		super

		@kilid = (new Kilid).getRootScope()

		@theatre = new EditingTheatre @

	run: ->

		@theatre.model.run()

		@