User = require "/lib/User"
protocol = "http"
host = "#{protocol}://events4me.in"

URL =
	sign_in: "#{host}/users/sign_in"
	sign_up: "#{host}/users/sign_up"


exports.getURL = (url) ->
	if User.isLogged()
		token = User.getAuthToken()
		"#{URL[url]}/?auth_token=#{token}"
	else
		"#{URL[url]}"