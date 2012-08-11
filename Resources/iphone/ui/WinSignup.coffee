Window = ->

	UI = require "/ui/Components"

	self = UI.createWindow
		titleid: "signup"
		modal: true

	setTimeout ->
		self.close()
	, 2000

	self

module.exports = Window