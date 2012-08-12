authTokenProperty = "auth_token"

# Verify if user is logged in the Application
exports.isLogged = ->
	Ti.App.Properties.hasProperty authTokenProperty

# Verify if user is logged in the Application
exports.getAuthToken = ->
	Ti.App.Properties.hasProperty authTokenProperty