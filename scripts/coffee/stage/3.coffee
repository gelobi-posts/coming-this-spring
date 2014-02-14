require 'theatrejs/node_modules/when/monitor/console'
SDI = require 'stupid-dom-interface'
Foxie = require 'foxie'
EditorView = require 'theatrejs/scripts/js/lib/EditorView'
EditorModel = require 'theatrejs/scripts/js/lib/EditorModel'
DynamicTimeline = require 'theatrejs/scripts/js/lib/DynamicTimeline'


body = Foxie('.body')
.putIn(document.body)

container1 = Foxie('.body-container')
.putIn(body)
.css('-webkit-transform-origin', '150% 150%')

container2 = Foxie('.body-container')
.putIn(body)
.css('-webkit-transform-origin', '150% 150%')

container3 = Foxie('.body-container')
.putIn(body)
.css('-webkit-transform-origin', '150% 150%')

container4 = Foxie('.body-container')
.putIn(body)
.css('-webkit-transform-origin', '-50% -50%')

container5 = Foxie('.body-container')
.putIn(body)
.css('-webkit-transform-origin', '-50% -50%')

container6 = Foxie('.body-container')
.putIn(body)
.css('-webkit-transform-origin', '-50% -50%')


dumBody 		  = new SDI body.node, {perspective: 400}
dumContainer1 = new SDI container1.node, {}
dumContainer2 = new SDI container2.node, {}
dumContainer3 = new SDI container3.node, {}
dumContainer4 = new SDI container4.node, {}
dumContainer5 = new SDI container5.node, {}
dumContainer6 = new SDI container6.node, {}


item = Foxie('.body-container-item')
.putIn(container1)
.css('background-image',"url('../images/pg-tile1.jpg')")


item2 = Foxie('.body-container-item')
.putIn(container1)
.css('background-image',"url('../images/pg-tile2.jpg')")


item3 = Foxie('.body-container-item')
.putIn(container2)
.css('background-image',"url('../images/pg-tile3.jpg')")


item4 = Foxie('.body-container-item')
.putIn(container2)
.css('background-image',"url('../images/pg-tile4.jpg')")


item5 = Foxie('.body-container-item')
.putIn(container3)
.css('background-image',"url('../images/pg-tile2.jpg')")


item6 = Foxie('.body-container-item')
.putIn(container3)
.css('background-image',"url('../images/pg-tile3.jpg')")


item6 = Foxie('.body-container-item')
.putIn(container4)
.css('background-image',"url('../images/pg-tile3.jpg')")


item7 = Foxie('.body-container-item')
.putIn(container4)
.css('background-image',"url('../images/pg-tile1.jpg')")


item8 = Foxie('.body-container-item')
.putIn(container5)
.css('background-image',"url('../images/pg-tile4.jpg')")


item9 = Foxie('.body-container-item')
.putIn(container5)
.css('background-image',"url('../images/pg-tile1.jpg')")

item10 = Foxie('.body-container-item')
.putIn(container6)
.css('background-image',"url('../images/pg-tile3.jpg')")






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

timeline.addObject 'body', dumBody

timeline.addObject 'container1', dumContainer1
timeline.addObject 'container2', dumContainer2
timeline.addObject 'container3', dumContainer3
timeline.addObject 'container4', dumContainer4
timeline.addObject 'container5', dumContainer5
timeline.addObject 'container6', dumContainer6

# debugger
editorModel.graph.getGroup('Tiles').getActor('body')
.addPropOfObject 'X', 'body', 'setTranslateX', 'getTranslateX'


editorModel.graph.getGroup('Tiles').getActor('container1')
.addPropOfObject 'X', 'container1', 'setTranslateX', 'getTranslateX'

editorModel.graph.getGroup('Tiles').getActor('container2')
.addPropOfObject 'X', 'container2', 'setTranslateX', 'getTranslateX'

editorModel.graph.getGroup('Tiles').getActor('container3')
.addPropOfObject 'X', 'container3', 'setTranslateX', 'getTranslateX'

editorModel.graph.getGroup('Tiles').getActor('container4')
.addPropOfObject 'X', 'container4', 'setTranslateX', 'getTranslateX'

editorModel.graph.getGroup('Tiles').getActor('container5')
.addPropOfObject 'X', 'container5', 'setTranslateX', 'getTranslateX'

editorModel.graph.getGroup('Tiles').getActor('container6')
.addPropOfObject 'X', 'container6', 'setTranslateX', 'getTranslateX'




editorModel.graph.getGroup('Tiles').getActor('container1')
.addPropOfObject 'Y', 'container1', 'setTranslateY', 'getTranslateY'

editorModel.graph.getGroup('Tiles').getActor('container2')
.addPropOfObject 'Y', 'container2', 'setTranslateY', 'getTranslateY'

editorModel.graph.getGroup('Tiles').getActor('container3')
.addPropOfObject 'Y', 'container3', 'setTranslateY', 'getTranslateY'

editorModel.graph.getGroup('Tiles').getActor('container4')
.addPropOfObject 'Y', 'container4', 'setTranslateY', 'getTranslateY'

editorModel.graph.getGroup('Tiles').getActor('container5')
.addPropOfObject 'Y', 'container5', 'setTranslateY', 'getTranslateY'

editorModel.graph.getGroup('Tiles').getActor('container6')
.addPropOfObject 'Y', 'container6', 'setTranslateY', 'getTranslateY'




editorModel.graph.getGroup('Tiles').getActor('container1')
.addPropOfObject 'Z', 'container1', 'setTranslateZ', 'getTranslateZ'

editorModel.graph.getGroup('Tiles').getActor('container2')
.addPropOfObject 'Z', 'container2', 'setTranslateZ', 'getTranslateZ'

editorModel.graph.getGroup('Tiles').getActor('container3')
.addPropOfObject 'Z', 'container3', 'setTranslateZ', 'getTranslateZ'

editorModel.graph.getGroup('Tiles').getActor('container4')
.addPropOfObject 'Z', 'container4', 'setTranslateZ', 'getTranslateZ'

editorModel.graph.getGroup('Tiles').getActor('container5')
.addPropOfObject 'Z', 'container5', 'setTranslateZ', 'getTranslateZ'

editorModel.graph.getGroup('Tiles').getActor('container6')
.addPropOfObject 'Z', 'container6', 'setTranslateZ', 'getTranslateZ'





editorModel.graph.getGroup('Tiles').getActor('container1')
.addPropOfObject 'Opacity', 'container1', 'setOpacity', 'getOpacity'

editorModel.graph.getGroup('Tiles').getActor('container2')
.addPropOfObject 'Opacity', 'container2', 'setOpacity', 'getOpacity'

editorModel.graph.getGroup('Tiles').getActor('container3')
.addPropOfObject 'Opacity', 'container3', 'setOpacity', 'getOpacity'

editorModel.graph.getGroup('Tiles').getActor('container4')
.addPropOfObject 'Opacity', 'container4', 'setOpacity', 'getOpacity'

editorModel.graph.getGroup('Tiles').getActor('container5')
.addPropOfObject 'Opacity', 'container5', 'setOpacity', 'getOpacity'

editorModel.graph.getGroup('Tiles').getActor('container6')
.addPropOfObject 'Opacity', 'container6', 'setOpacity', 'getOpacity'




editorModel.graph.getGroup('Tiles').getActor('container1')
.addPropOfObject 'RotateX', 'container1', 'setRotateX', 'getRotateX'

editorModel.graph.getGroup('Tiles').getActor('container2')
.addPropOfObject 'RotateX', 'container2', 'setRotateX', 'getRotateX'

editorModel.graph.getGroup('Tiles').getActor('container3')
.addPropOfObject 'RotateX', 'container3', 'setRotateX', 'getRotateX'

editorModel.graph.getGroup('Tiles').getActor('container4')
.addPropOfObject 'RotateX', 'container4', 'setRotateX', 'getRotateX'

editorModel.graph.getGroup('Tiles').getActor('container5')
.addPropOfObject 'RotateX', 'container5', 'setRotateX', 'getRotateX'

editorModel.graph.getGroup('Tiles').getActor('container6')
.addPropOfObject 'RotateX', 'container6', 'setRotateX', 'getRotateX'




editorModel.graph.getGroup('Tiles').getActor('container1')
.addPropOfObject 'RotateY', 'container1', 'setRotateY', 'getRotateY'

editorModel.graph.getGroup('Tiles').getActor('container2')
.addPropOfObject 'RotateY', 'container2', 'setRotateY', 'getRotateY'

editorModel.graph.getGroup('Tiles').getActor('container3')
.addPropOfObject 'RotateY', 'container3', 'setRotateY', 'getRotateY'

editorModel.graph.getGroup('Tiles').getActor('container4')
.addPropOfObject 'RotateY', 'container4', 'setRotateY', 'getRotateY'

editorModel.graph.getGroup('Tiles').getActor('container5')
.addPropOfObject 'RotateY', 'container5', 'setRotateY', 'getRotateY'

editorModel.graph.getGroup('Tiles').getActor('container6')
.addPropOfObject 'RotateY', 'container6', 'setRotateY', 'getRotateY'





# and make the view visible
editorModel.run()