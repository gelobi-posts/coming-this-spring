require 'theatrejs/node_modules/when/monitor/console'
SDI = require 'stupid-dom-interface'
Foxie = require 'foxie'
EditorView = require 'theatrejs/scripts/js/lib/EditorView'
EditorModel = require 'theatrejs/scripts/js/lib/EditorModel'
DynamicTimeline = require 'theatrejs/scripts/js/lib/DynamicTimeline'
AwesomePie = require '../lib/AwesomePie'


svg = Foxie('svg:svg')
.putIn(document.body)
.attr('width', '1600')
.attr('height', '900')
.moveXTo(400)
.attr('xmlns', 'http://www.w3.org/2000/svg')

awp = new AwesomePie svg.node, 150, 150, 100, 0, 0,

	'stroke': '#C55186'
	'stroke-width': '30'
	'fill': 'none'


awp2 = new AwesomePie svg.node, 150, 150, 50, 0, 0,

	'stroke': '#8D3A61'
	'stroke-width': '100'
	'fill': '#bbddee'

awp3 = new AwesomePie svg.node, 150, 150, 70, 0, 0,

	'stroke': '#B04979'
	'stroke-width': '30'
	'fill': 'none'

awp5 = new AwesomePie svg.node, 150, 150, 28, 0, 359.99,

	'stroke': '#3E4957'
	'stroke-width': '55'
	'opacity':'.7'

awp4 = new AwesomePie svg.node, 150, 150, 80, 0, 0,

	'stroke': '#D9E6F7'
	'stroke-width': '70'
	'opacity':'.8'


awpb = new AwesomePie svg.node, 500, 150, 80, 0, 0,

	'stroke': '#D9E6F7'
	'stroke-width': '70'
	'opacity':'.8'
	'fill': 'none'



# instantiate theatrejs with 60fps
timeline = new DynamicTimeline 60

# instantiate the UI model, and name it 'main'
editorModel = new EditorModel 'main', timeline

# tell it to communicate to the server on port 3097, on namespace 'pg1'
# with password 'qwerty'
editorModel.communicateWith 'http://localhost:3097', 'pg', 'qwerty'

# instantiate the model's UI and put it in the body
view = new EditorView editorModel, document.body

# make sure theatrejs ticks in sync with our scene
Foxie.timing.onEachFrame view.tick

# # set up the graph on our timeline
# setupGraphOn editorModel, graph

timeline.addObject 'awesomePieDeg', awp

editorModel.graph.getGroup('AwesomePie').getActor('AwesomePie')
.addPropOfObject 'PieDeg', 'awesomePieDeg', 'setEnd', 'get'

editorModel.graph.getGroup('AwesomePie').getActor('AwesomePie')
.addPropOfObject 'PieDegStart', 'awesomePieDeg', 'setStart', 'get'

timeline.addObject 'awesomePie2Deg', awp2

editorModel.graph.getGroup('AwesomePie').getActor('AwesomePie')
.addPropOfObject 'Pie2Deg', 'awesomePie2Deg', 'setEnd', 'get'

editorModel.graph.getGroup('AwesomePie').getActor('AwesomePie')
.addPropOfObject 'Pie2DegStart', 'awesomePie2Deg', 'setStart', 'get'


timeline.addObject 'awesomePie3Deg', awp3

editorModel.graph.getGroup('AwesomePie').getActor('AwesomePie')
.addPropOfObject 'Pie3End', 'awesomePie3Deg', 'setEnd', 'get'

editorModel.graph.getGroup('AwesomePie').getActor('AwesomePie')
.addPropOfObject 'Pie3Start', 'awesomePie3Deg', 'setStart', 'get'

timeline.addObject 'awesomePie4Deg', awp4

editorModel.graph.getGroup('AwesomePie').getActor('AwesomePie')
.addPropOfObject 'Pie4End', 'awesomePie4Deg', 'setEnd', 'get'

editorModel.graph.getGroup('AwesomePie').getActor('AwesomePie')
.addPropOfObject 'Pie4Start', 'awesomePie4Deg', 'setStart', 'get'

timeline.addObject 'awesomeBounce', awpb

editorModel.graph.getGroup('AwesomePie').getActor('AwesomePie')
.addPropOfObject 'PieBounceEnd', 'awesomeBounce', 'setEnd', 'get'

editorModel.graph.getGroup('AwesomePie').getActor('AwesomePie')
.addPropOfObject 'PieBounceStart', 'awesomeBounce', 'setStart', 'get'



# and make the view visible
editorModel.run()