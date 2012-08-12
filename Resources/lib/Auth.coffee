Login = (type) ->

	UI = require "/ui/Components"
	URL = require "/lib/URL"

	self = UI.createWindow()
	parameterAccessToken = "auth_token"

	# WebView
	webView = Ti.UI.createWebView
		url: URL[type]
	self.add webView

	# Events handler
	webView.addEventListener "beforeload", (e) ->
		
		url = e.url

		if url.indexOf(parameterAccessToken) != -1
			indexOfToken = url.indexOf(parameterAccessToken) + parameterAccessToken.length
			token = url.substr(indexOfToken + 1)

	self

module.exports = Login