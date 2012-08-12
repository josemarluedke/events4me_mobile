Window = ->

	UI = require "/ui/Components"

	rows = []

	self = UI.createWindow
		title: "me"


	tableView = UI.createTableView
		style: Ti.UI.iPhone.TableViewStyle.GROUPED
	self.add tableView


	# Methods
	getDataFromLocal = ->
		me = Ti.App.Properties.getObject "me"
		showProfileInTableView me


	getData = ->
		getDataFromLocal()


	showProfileInTableView = (me) ->
		# TODO: Create profile template


	# Events handler
	self.addEventListener "open", ->
		getData()


	self


module.exports = Window