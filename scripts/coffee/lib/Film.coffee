Display = require './film/Display'

module.exports = class Film

	constructor: (@id) ->

		do @_initRaf

		@display = new Display @

		@sets = {}

	_initRaf: ->

		listeners = @_listeners = []

		requestAnimationFrame frame = (t) ->

			for listener in listeners

				listener t

			requestAnimationFrame frame

	tick: (listener) ->

		@_listeners.push listener

	addSet: (set) ->

		id = set.id

		if @sets[id]?

			throw Error "Set '#{id}' already exists"

		@sets[id] = set

		@

	_setupDomEl: (groupName, actorName, el, props) ->

		objName = String(groupName + ' ' + actorName).replace(/\s+/g, '-').toLowerCase()

		actor = @theatre.model.graph.getGroup groupName
		.getActor actorName

		@theatre.timeline.addObject objName, el

		shouldAccountForProps = Array.isArray(props) and props.length > 0

		if not shouldAccountForProps or 'opacity' in props

			actor.addPropOfObject 'Opacity', objName, 'opacity', 1

		if not shouldAccountForProps or 'rotation' in props

			actor.addPropOfObject 'Rotation X', objName, 'rotateX', 0
			actor.addPropOfObject 'Rotation Y', objName, 'rotateY', 0
			actor.addPropOfObject 'Rotation Z', objName, 'rotateZ', 0

		if not shouldAccountForProps or 'translation' in props

			actor.addPropOfObject 'X', objName, 'x', 0
			actor.addPropOfObject 'Y', objName, 'y', 0
			actor.addPropOfObject 'Z', objName, 'z', 0

		if not shouldAccountForProps or 'scale' in props

			actor.addPropOfObject 'Scale X', objName, 'scaleX', 1
			actor.addPropOfObject 'Scale Y', objName, 'scaleY', 1
			actor.addPropOfObject 'Scale Z', objName, 'scaleZ', 1

		if not shouldAccountForProps or 'dims' in props

			actor.addPropOfObject 'Width', objName, 'width', 0
			actor.addPropOfObject 'Height', objName, 'height', 0

		actor