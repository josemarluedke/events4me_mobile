authTokenProperty = "auth_token"

# Verify if user is logged in the Application
exports.isLogged = ->
	Ti.App.Properties.hasProperty authTokenProperty

# Get the AuthToken of user
exports.getAuthToken = ->
	Ti.App.Properties.getString authTokenProperty