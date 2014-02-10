EditorModel = require 'theatrejs/scripts/js/lib/EditorModel'
EditorView = require 'theatrejs/scripts/js/lib/EditorView'
DynamicTimeline = require 'theatrejs/scripts/js/lib/DynamicTimeline'

module.exports = class EditingTheatre

	constructor: (@film) ->

		@timeline = new DynamicTimeline 60

		@model = new EditorModel 'the-panels', @timeline
		@view = new EditorView @model, document.body

		@film.tick @view.tick

		@model.communicateWith 'http://localhost:6543', '1', 'qwerty'

		@pieceBoundriesEventController = @timeline.addEventController 'Piece Boundries'