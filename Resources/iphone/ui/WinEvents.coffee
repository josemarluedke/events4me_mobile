Window = ->

	UI = require "/ui/Components"

	rows = []

	self = UI.createWindow
		title: "events"


	tableView = UI.createTableView()
	self.add tableView


	# Methods
	getDataFromLocal = ->
		events = Ti.App.Properties.getList "events"
		showDataInTableView events


	getData = ->
		getDataFromLocal()


	showDataInTableView = (data) ->
		rows = []

		for _event in data
			do (_event) ->
				rows.push UI.createTableViewEventRow _event

		tableView.setData rows


	# Events handler
	self.addEventListener "open", ->
		getData()


	self


module.exports = Window