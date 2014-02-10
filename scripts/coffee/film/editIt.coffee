EditingFilm = require '../lib/EditingFilm'
setupSets = require './setupSets'

film = new EditingFilm 'coming-this-spring'

setupSets film

film.run()

film.kilid.on 'ctrl+\\', ->

	document.body.classList.toggle 'debug'

window.film = film