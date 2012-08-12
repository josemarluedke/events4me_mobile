ApplicationWindow = ->

	UI = require "/ui/Components"
	User = require "/lib/User"
	WinEvents = require "/ui/WinEvents"
	WinProfile = require "/ui/WinProfile"

	self = UI.createTabGroup()

	# Events
	tabEvents = UI.createTab
		titleid: "events"
	winEvents = new WinEvents
		tab: tabEvents
	tabEvents.window = winEvents
	self.addTab tabEvents

	# My Events
	tabMyEvents = UI.createTab
		titleid: "my_events"
	winMyEvents = new WinEvents
		tab: tabMyEvents
	tabMyEvents.window = winMyEvents
	self.addTab tabMyEvents

	# Profile
	tabProfile = UI.createTab
		titleid: "profile"
	winProfile = new WinProfile
		tab: tabProfile
	tabProfile.window = winProfile
	self.addTab tabProfile

	# Events handler
	self.addEventListener "open", ->

		if !User.isLogged()

			WinAuth = require "/ui/WinAuth"
			winAuth = new WinAuth()
			winAuth.open()

	self

module.exports = ApplicationWindow