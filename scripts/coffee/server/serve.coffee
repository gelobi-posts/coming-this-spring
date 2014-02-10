path = require 'path'

repoPath = path.join path.dirname(module.filename), '../../../'

require('theatrejs').serve repoPath, 3097, 'saves', ['qwerty']