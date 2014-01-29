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

go = document.createElement 'div'
go.classList.add 'login-line-go'
line.appendChild go

goBtn = document.createElement 'div'
goBtn.classList.add 'login-line-go-btn'
go.appendChild goBtn

profileIcon = document.createElement 'div'
profileIcon.classList.add 'login-line-go-profile'
go.appendChild profileIcon

dumGo = new SDI go
dumGo.setPerspective(400)

dumGoBtn = new SDI goBtn

dumProfile = new SDI profileIcon
dumProfile.setOpacity(0)

attach2icons =

	setOpacity: (i) ->

		dumProfile.setOpacity(i)
		dumGoBtn.setOpacity(1 - i)

	getOpacity: ->

		dumProfile.getOpacity()

	setRotateY: (i) ->

		dumProfile.setRotateY(180 - i)
		dumGoBtn.setRotateY(i)

	getRotateY: ->

		dumGoBtn.getRotateY()


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



logged = document.createElement 'div'
logged.classList.add 'login-line-logged'
go.appendChild logged

dumLogged = new SDI logged
dumLogged.setOpacity(0)
dumLogged.setPerspective(400)


userLogged = document.createElement 'div'
userLogged.innerHTML = 'Charles Bolden'
userLogged.classList.add 'login-line-logged-user'
logged.appendChild userLogged

dumUserLogged = new SDI userLogged


infoLogged = document.createElement 'div'
infoLogged.innerHTML = '28d 08h 37m'
infoLogged.classList.add 'login-line-logged-info'
logged.appendChild infoLogged

dumInfoLogged = new SDI infoLogged


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

timeline.addObject 'logged', dumLogged

editorModel.graph.getGroup('PageObjects').getActor('loggedParams')
.addPropOfObject 'Opacity', 'logged', 'setOpacity', 'getOpacity'

editorModel.graph.getGroup('PageObjects').getActor('loggedParams')
.addPropOfObject 'RotateY', 'logged', 'setRotateY', 'getRotateY'

# timeline.addObject 'GoButton', dumGoBtn

# editorModel.graph.getGroup('PageObjects').getActor('GoButton')
# .addPropOfObject 'Opacity', 'GoButton', 'setOpacity', 'getOpacity'

# editorModel.graph.getGroup('PageObjects').getActor('GoButton')
# .addPropOfObject 'RotateY', 'GoButton', 'setRotateY', 'getRotateY'

# timeline.addObject 'ProfileIcon', dumProfile

# editorModel.graph.getGroup('PageObjects').getActor('ProfileIcon')
# .addPropOfObject 'Opacity', 'ProfileIcon', 'setOpacity', 'getOpacity'

# editorModel.graph.getGroup('PageObjects').getActor('ProfileIcon')
# .addPropOfObject 'RotateY', 'ProfileIcon', 'setRotateY', 'getRotateY'


timeline.addObject 'IconsOp', attach2icons

editorModel.graph.getGroup('PageObjects').getActor('Icons')
.addPropOfObject 'Opacity', 'IconsOp', 'setOpacity', 'getOpacity'

editorModel.graph.getGroup('PageObjects').getActor('Icons')
.addPropOfObject 'RotateY', 'IconsOp', 'setRotateY', 'getRotateY'


# and make the view visible
editorModel.run()