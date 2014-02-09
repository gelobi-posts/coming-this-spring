EditingFilm = require '../lib/EditingFilm'
setupSets = require './setupSets'

film = new EditingFilm 'coming-this-spring'

setupSets film

console.log film

film.run()