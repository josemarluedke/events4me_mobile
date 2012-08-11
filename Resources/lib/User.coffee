# Verify if user is logged in the Application
exports.isLogged = ->
	Ti.App.Properties.hasProperty "access_token"