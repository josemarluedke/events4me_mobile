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


# Button
exports.createButton = (dict) ->

	defaults = 
		backgroundColor: "#FFFFFF"

	button = Ti.UI.createButton applyConfig dict, defaults



# TableViewEventRow
exports.createTableViewEventRow = (dict) ->

	self = Ti.UI.createTableViewRow
		title: dict.name

	self


# CoffeeScript extends
applyConfig = (object, config) ->
	extend (extend {}, object), config

extend = exports.extend = (object, properties) ->
	for key, val of properties
		object[key] = val
	object