require 'theatrejs/node_modules/when/monitor/console'
SDI = require 'stupid-dom-interface'
Foxie = require 'foxie'
EditorView = require 'theatrejs/scripts/js/lib/EditorView'
EditorModel = require 'theatrejs/scripts/js/lib/EditorModel'
DynamicTimeline = require 'theatrejs/scripts/js/lib/DynamicTimeline'
AwesomeType = require '../lib/AwesomeType'

loginPage = document.createElement 'div'
loginPage.classList.add 'login'
document.body.appendChild loginPage


line = document.createElement 'div'
line.classList.add 'login-line'
loginPage.appendChild line

holder = document.createElement 'div'
holder.classList.add 'login-line-holder'
line.appendChild holder

box = document.createElement 'div'
box.classList.add 'login-line-holder-box'
holder.appendChild box

dumBox = new SDI box

goBtn = document.createElement 'div'
goBtn.classList.add 'login-line-go'
line.appendChild goBtn

dumGo = new SDI goBtn

username = document.createElement 'div'
username.classList.add 'login-line-holder-box-input'
username.classList.add 'login-line-holder-box-username'
box.appendChild username

password = document.createElement 'div'
password.classList.add 'login-line-holder-box-input'
password.classList.add 'login-line-holder-box-password'
box.appendChild password


atu = new AwesomeType username
atp = new AwesomeType password

atu.createText('Nasa\'s Boss :|')
atp.createText('***********')

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

timeline.addObject 'username', atu

editorModel.graph.getGroup('Characters').getActor('AwesomeType')
.addPropOfObject 'Username', 'username', 'animateAt', 'get'

timeline.addObject 'password', atp

editorModel.graph.getGroup('Characters').getActor('AwesomeType')
.addPropOfObject 'Password', 'password', 'animateAt', 'get'

timeline.addObject 'box', dumBox

editorModel.graph.getGroup('PageObjects').getActor('BoxPositions')
.addPropOfObject 'x', 'box', 'setTranslateX', 'getTranslateX'

timeline.addObject 'go', dumGo

editorModel.graph.getGroup('PageObjects').getActor('GoPositions')
.addPropOfObject 'x', 'go', 'setTranslateX', 'getTranslateX'


# and make the view visible
editorModel.run()