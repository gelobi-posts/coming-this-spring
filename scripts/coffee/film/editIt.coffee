EditingFilm = require '../lib/EditingFilm'
setupSets = require './setupSets'

film = new EditingFilm 'coming-this-spring'

setupSets film

film.run()

window.film = film