Window = (_event) ->

	UI = require "/ui/Components"
	URL = require "/lib/URL"
	Properties = Ti.App.Properties

	rows = []


	self = UI.createWindow
		titleid: "event"

	# Create TableView HeaderView
	headerView = Ti.UI.createView
		height: 80
		width: Ti.UI.FILL

	# Name
	labelNameEvent = Ti.UI.createLabel
		text: _event.name
		left: 20
		right: 20
		top: 20
		shadowColor: "#FFFFFF"
		shadowOffset: { x: 0, y: 1}
		font: { fontSize: 18, fontWeight: "bold" }
	headerView.add labelNameEvent

	# Local
	labelLocalEvent = Ti.UI.createLabel
		text: _event.address
		left: 20
		right: 20
		top: 43
		shadowColor: "#FFFFFF"
		shadowOffset: { x: 0, y: 1}
		font: { fontSize: 14 }
	headerView.add labelLocalEvent

	tableView = UI.createTableView
		style: Ti.UI.iPhone.TableViewStyle.GROUPED
		headerView: headerView
	self.add tableView

	self


module.exports = Window