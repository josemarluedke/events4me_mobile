Window = ->

	UI = require "/ui/Components"
	User = require "/lib/User"

	self = UI.createWindow
		title: "events"

	# Events handler
	self.addEventListener "open", ->

		if User.isLogged()
			Ti.API.info "User is logged"
			# TODO: User is logged in

		else
			Ti.API.info "User is not logged"
			WinSignup = require "/ui/WinSignup"
			winSignup = new WinSignup()
			winSignup.open()

	self


module.exports = Window