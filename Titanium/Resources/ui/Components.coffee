# Defaults
gradientColor = undefined
isAndroid = if Ti.Platform.osname == "android" then true else false


# TabGroup
exports.createTabGroup = (dict) ->
	
	defaults = 
		backgroundColor: "#FFFFFF"

	tabGroup = Ti.UI.createTabGroup applyConfig dict, defaults


# Tab
exports.createTab = (dict) ->
	
	defaults = 
		backgroundColor: "#FFFFFF"

	tab = Ti.UI.createTab applyConfig dict, defaults


# Window
exports.createWindow = (dict) ->
	
	defaults = 
		backgroundColor: "#FFFFFF"
		barColor: gradientColor

	window = Ti.UI.createWindow applyConfig dict, defaults


# NavigationGroup
exports.createNavigationGroup = (dict) ->

	defaults = {}

	nav = Ti.UI.iPhone.createNavigationGroup applyConfig dict, defaults


# TableView
exports.createTableView = (dict) ->

	defaults = {}

	tableView = Ti.UI.createTableView applyConfig dict, defaults


# SearchBar
exports.createSearchBar = (dict) ->

	defaults =
		barColor: gradientColor
		height: 44
		top: 0

	searchBar = Ti.UI.createSearchBar applyConfig dict, defaults

	# Events handler
	searchBar.addEventListener "focus", ->
		@setShowCancel true, { animated: true }

	searchBar.addEventListener "blur", ->
		@setShowCancel false, { animated: true }

	searchBar.addEventListener "cancel", ->
		@blur()
		@setShowCancel false, { animated: true }

	searchBar

# Button
exports.createButton = (dict) ->

	defaults = 
		backgroundColor: "#FFFFFF"

	button = Ti.UI.createButton applyConfig dict, defaults



# TableViewEventRow
exports.createTableViewEventRow = (dict) ->

	self = Ti.UI.createTableViewRow
		event_obj: dict
		height: Ti.UI.SIZE
		hasChild: true

	content = Ti.UI.createView
		height: Ti.UI.SIZE
		layout: "vertical"
		top: 5
		bottom: 10
	self.add content

	content.add Ti.UI.createLabel
		text: dict.name
		font: { fontSize: 18, fontWeight: "bold" }
		left: 10
		top: 5
		right: 5
		highlightedColor: "#FFFFFF"

	content.add Ti.UI.createLabel
		text: dict.description
		font: { fontSize: 14 }
		color: "#666666"
		left: 10
		top: 5
		right: 5
		highlightedColor: "#FFFFFF"

	self


# CoffeeScript extends
applyConfig = (object, config) ->
	extend (extend {}, object), config

extend = exports.extend = (object, properties) ->
	for key, val of properties
		object[key] = val
	object