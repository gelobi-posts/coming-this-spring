Set = require '../../lib/Film/Set'
El = require 'stupid-dom-interface'

module.exports = class PanelsSet extends Set

	constructor: ->

		super

		@id = 'panels'

		@container = El '#panels-container.container'

		do @_prepareBg

		do @_prepareLogin

		@film.theatre.pieceBoundriesEventController.defineType 'panels',

			fn: (forward, last, supposedT, currentT, args) =>

				if forward

					@bgImage.inside @film.display.bgLayer
					@container.inside @film.display.stageEl

				else

					@bgImage.detach()
					@container.detach()

				return

		@film.theatre.pieceBoundriesEventController.events.add 'panels', 4001

	_prepareBg: ->

		@bgImage = El '#panels-bg-image',

			perspective: 900

		@_setupDomEl  'Panels - Background', 'Image', @bgImage, [
			'opacity', 'rotation', 'translation'
		]

	_prepareLogin: ->

		platform = El '#panels-login-platform'
		.width 529
		.height 49
		.css

			background: '#000'
			position: 'absolute'
			top: 432
			left: 550

		.inside @container

		@_setupDomEl  'Panels - Login', 'Platform', platform, [
			'opacity', 'rotation', 'translation', 'localTranslation', 'transformOrigin'
		]

		button = El '#panels-login-button'
		.width 58
		.height 46
		.css

			position: 'absolute'
			border: '2px solid rgba(255, 255, 255, 0.4)'
			background: 'rgba(222, 222, 222, 0.67)'
			borderRadius: '2px'
			top: 431
			left: 1093

		.inside @container

		@_setupDomEl  'Panels - Login', 'Button', button, [
			'opacity', 'rotation', 'translation'
		]

		buttonArrow = El '#panels-login-button-arrow',

			css:

				top: 8
				left: 22

			inside: button

		inputContainer =

			width: 190
			height: 20

			css:

				position: 'absolute'

				borderBottom: '1px solid #494949'

			inside: platform

		unContainer = El '#panels-login-un-container', inputContainer
		.from css:

			top: 15
			left: 32

		@_setupDomEl  'Panels - Login', 'UN Container', unContainer, [
			'opacity', 'rotation', 'translation'
		]

		pwContainer = El '#panels-login-pw-container', inputContainer
		.from css:

			top: 15
			left: 299

		@_setupDomEl  'Panels - Login', 'PW Container', pwContainer, [
			'opacity', 'rotation', 'translation'
		]

		unText = El '#panels-login-un-text'
		.inside unContainer
		.html 'Username'

		pwText = El '#panels-login-pw-text'
		.inside pwContainer
		.html 'Password'

		forgot = El '#panels-login-forgot',

			css:

				top: 516
				left: 730

			html: 'Forgot your password?'

			inside: @container

		@_setupDomEl  'Panels - Login', 'Forgot', forgot, [
			'opacity', 'rotation', 'translation'
		]