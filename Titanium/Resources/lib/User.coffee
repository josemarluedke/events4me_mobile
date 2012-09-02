authTokenProperty = "auth_token"

# Verify if user is logged in the Application
exports.isLogged = ->
	Ti.App.Properties.hasProperty authTokenProperty

# Get user AuthToken
exports.getAuthToken = ->
	Ti.App.Properties.getString authTokenProperty

# Set user AuthToken
exports.setAuthToken = (value) ->
	Ti.App.Properties.setString authTokenProperty, value

# Remove user AuthToken
exports.removeAuthToken = ->
	Ti.App.Properties.removeProperty authTokenProperty