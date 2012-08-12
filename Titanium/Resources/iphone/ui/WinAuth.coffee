Window = ->

	UI = require "/ui/Components"


	# WinBase
	self = UI.createWindow
		navBarHidden: true
		modal: true

	# Window
	win = UI.createWindow
		titleid: "signup"

	closeWindow = UI.createButton
		title: "Close"
	win.setLeftNavButton closeWindow

	# NavigationGroup
	nav = UI.createNavigationGroup
		window: win
	self.add nav

	# Auth Button
	buttonSignIn = UI.createButton
		left: 10
		right: 10
		height: 44
		top: 100
		titleid: "sign_in"
	win.add buttonSignIn

	buttonSignUp = UI.createButton
		left: 10
		right: 10
		height: 44
		top: 164
		titleid: "sign_up"
	win.add buttonSignUp


	# Events handler
	buttonSignIn.addEventListener "click", ->
		Auth = require "/lib/Auth"
		nav.open new Auth("sign_in")

	buttonSignUp.addEventListener "click", ->
		Auth = require "/lib/Auth"
		nav.open new Auth("sign_up")

	closeWindow.addEventListener "click", ->
		self.close()


	self

module.exports = Window