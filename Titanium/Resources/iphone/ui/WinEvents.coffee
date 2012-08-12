Window = (dict) ->

	UI = require "/ui/Components"
	URL = require "/lib/URL"
	User = require "/lib/User"
	ProgressView = require "/lib/ProgressView"

	rows = []
	rowSelectedIndex = null
	Properties = Ti.App.Properties
	progressView = new ProgressView()

	self = UI.createWindow
		titleid: "events"


	searchBar = UI.createSearchBar
		hintText: L("search_event")
	self.add searchBar

	tableView = UI.createTableView
		top: 44
	self.add tableView

	# Add ProgressView to Window
	self.add progressView

	# Methods
	getDataFromLocal = ->
		events = Ti.App.Properties.getList "events"
		showDataInTableView events


	getDataFromWS = ->
		xhr = Ti.Network.createHTTPClient
			timeout: 10000
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

		# Hide ProgressView
		progressView._hide()


	tableView.addEventListener "click", (e) ->

		# Select row
		rowSelectedIndex = e.index
		tableView.selectRow(e.index, { animated : false })

		# Open Window
		event_obj = e.rowData.event_obj

		WinDetailEvent = require "/ui/WinDetailEvent"
		winDetailEvent = new WinDetailEvent(event_obj)
		dict.tab.open winDetailEvent

	# Events handler
	self.addEventListener "focus", ->
		
		if User.isLogged() and rows.length == 0
			getData()

		setTimeout ->
			if rowSelectedIndex != null
				tableView.deselectRow(rowSelectedIndex, { duration: 150 })
		, 10

	self


module.exports = Window