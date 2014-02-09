HiThereSet = require './sets/HiThereSet'
PanelsSet = require './sets/PanelsSet'

module.exports = (film) ->

	film.addSet new HiThereSet film
	film.addSet new PanelsSet film