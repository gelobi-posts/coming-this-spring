Film = require './Film'
Kilid = require 'kilid'
Grids = require './editingFilm/Grids'
EditingTheatre = require './editingFilm/EditingTheatre'

module.exports = class EditingFilm extends Film

	constructor: ->

		super

		@kilid = (new Kilid).getRootScope()

		@theatre = new EditingTheatre @

		@grids = new Grids @

	run: ->

		@theatre.model.run()

		@