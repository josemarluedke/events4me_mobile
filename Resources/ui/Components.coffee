# Defaults
gradientColor = undefined
isAndroid = if Ti.Platform.osname == "android" then true else false

# Window
exports.createWindow = (dict) ->
	
	defaults = 
		backgroundColor: "#FFFFFF"
		barColor: gradientColor
		navBarHidden: if isAndroid then true else false

	window = Ti.UI.createWindow applyConfig dict, defaults


# TableView
exports.createTableView = (dict) ->

	defaults = 
		backgroundColor: "#FFFFFF"

	tableView = Ti.UI.createTableView applyConfig dict, defaults


# Button
exports.createButton = (dict) ->

	defaults = 
		backgroundColor: "#FFFFFF"

	button = Ti.UI.createButton applyConfig dict, defaults


# CoffeeScript extends
applyConfig = (object, config) ->
	extend (extend {}, object), config

extend = exports.extend = (object, properties) ->
	for key, val of properties
		object[key] = val
	object