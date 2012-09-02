Login = (parent, type) ->

	UI = require "/ui/Components"
	URL = require "/lib/URL"
	User = require "/lib/User"

	self = UI.createWindow()
	parameterAccessToken = "auth_token"

	# WebView
	webView = Ti.UI.createWebView
		url: URL.getURL type
	self.add webView

	# Events handler
	webView.addEventListener "beforeload", (e) ->
		
		url = e.url

		# User mobile version of facebook login page
		if url.indexOf('https://www.facebook.com') != -1
			webView.setUrl url.replace('https://www.', 'https://m.')

		match = url.match /events4me\.in\/(?!.*twitter|facebook).+auth_token=([^&]+)/
		if match?.length == 2
			token = match[1]
			User.setAuthToken token

			parent.close()

	self

module.exports = Login