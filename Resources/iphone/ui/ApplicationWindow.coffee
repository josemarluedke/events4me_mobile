ApplicationWindow = ->

	UI = require "/ui/Components"
	User = require "/lib/User"
	WinEvents = require "/ui/WinEvents"

	self = UI.createTabGroup()

	# Events
	winEvents = new WinEvents()
	tabEvents = UI.createTab
		titleid: "events"
		window: winEvents
	winEvents.currentTab = tabEvents
	self.addTab tabEvents

	# My Events
	winMyEvents = new WinEvents()
	tabMyEvents = UI.createTab
		titleid: "my_events"
		window: winMyEvents
	winMyEvents.currentTab = tabMyEvents
	self.addTab tabMyEvents

	# Profile
	winProfile = new WinEvents()
	tabProfile = UI.createTab
		titleid: "profile"
		window: winProfile
	winProfile.currentTab = tabProfile
	self.addTab tabProfile

	# Events handler
	self.addEventListener "open", ->

		if !User.isLogged()

			WinAuth = require "/ui/WinAuth"
			winAuth = new WinAuth()
			winAuth.open()

	self

module.exports = ApplicationWindow