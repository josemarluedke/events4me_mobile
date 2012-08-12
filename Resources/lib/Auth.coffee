Login = (type) ->

	UI = require "/ui/Components"
	URL = require "/lib/URL"

	self = UI.createWindow()

	# WebView
	webView = Ti.UI.createWebView
		url: URL[type]
	self.add webView

	# Events handler
	webView.addEventListener "beforeload", (e) ->
		Ti.API.info e.url

	self

module.exports = Login