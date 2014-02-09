path = require 'path'

repoPath = path.join path.dirname(module.filename), '../../../'

require('theatrejs').serve repoPath, 6543, 'timelines', ['qwerty']