require 'theatrejs/node_modules/when/monitor/console'
DUM = require 'stupid-dom-interface'
Foxie = require 'foxie'
SvgCurver = require 'svg-curvy'
EditorView = require 'theatrejs/scripts/js/lib/EditorView'
EditorModel = require 'theatrejs/scripts/js/lib/EditorModel'
DynamicTimeline = require 'theatrejs/scripts/js/lib/DynamicTimeline'

theatreDum = DUM('.theatre',{z: 100, left: 0, bottom: 0, height: 400, width: 1600})
.inside(document.body)

seekerDum = DUM('.theatrejs-seekbar-seeker', {z: 100, top: 40})
.inside(theatreDum.node)

svgCurver = new SvgCurver theatreDum, 330, 2100

curve = svgCurver.newCurve {leftPointX: 10, leftPointY: 250, rightPointX: 1220, rightPointY: 100}, {leftHandlerX: 100, leftHandlerY: 170, rightHandlerX: 400, rightHandlerY: 100}


curveStatic = DUM('.curve-static',{z: 100})
.inside(theatreDum)


dayoreDum = DUM('.dayore', {z: 100, top: 45, left: -100, height: 100, width: 100})
.inside(document.body)



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

timeline.addObject 'theatrejs', theatreDum

editorModel.graph.getGroup('Theatre').getActor('Element')
.addPropOfObject 'y', 'theatrejs', 'y', 'getY'

timeline.addObject 'seeker', seekerDum

editorModel.graph.getGroup('Theatre').getActor('seeker')
.addPropOfObject 'x', 'seeker', 'x', 'getX'



timeline.addObject 'svg', curve

editorModel.graph.getGroup('Theatre').getActor('svg')
.addPropOfObject 'leftPointX', 'svg', 'setLeftPointX', 'get'

editorModel.graph.getGroup('Theatre').getActor('svg')
.addPropOfObject 'leftPointY', 'svg', 'setLeftPointY', 'get'


editorModel.graph.getGroup('Theatre').getActor('svg')
.addPropOfObject 'RightPointX', 'svg', 'setRightPointX', 'get'

editorModel.graph.getGroup('Theatre').getActor('svg')
.addPropOfObject 'RightPointY', 'svg', 'setRightPointY', 'get'



timeline.addObject 'dayore', dayoreDum

editorModel.graph.getGroup('Theatre').getActor('dayore')
.addPropOfObject 'rotateZ', 'dayore', 'rotateZ', 0

editorModel.graph.getGroup('Theatre').getActor('dayore')
.addPropOfObject 'x', 'dayore', 'x', 0

editorModel.graph.getGroup('Theatre').getActor('dayore')
.addPropOfObject 'y', 'dayore', 'y', 0



# and make the view visible
editorModel.run()