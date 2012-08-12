Window = ->

	UI = require "/ui/Components"
	URL = require "/lib/URL"

	rows = []
	Properties = Ti.App.Properties

	self = UI.createWindow
		title: "events"


	searchBar = UI.createSearchBar
		hintText: L("search_event")
	self.add searchBar

	tableView = UI.createTableView
		top: 44
	self.add tableView


	# Methods
	getDataFromLocal = ->
		events = Ti.App.Properties.getList "events"
		showDataInTableView events


	getDataFromWS = ->
		xhr = Ti.Network.createHTTPClient
			onerror: ->
				getDataFromLocal()
			oncancel: ->
				getDataFromLocal()
			onload: ->
				events = JSON.parse this.responseText
				Properties.setString "events", JSON.stringify events
				
				showEventsInTableView events

		xhr.open "GET", URL.getURL "events"
		xhr.send()


	getData = ->
		if Ti.Network.type == 0
			getDataFromLocal()
		else
			getDataFromWS()


	showEventsInTableView = (data) ->
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