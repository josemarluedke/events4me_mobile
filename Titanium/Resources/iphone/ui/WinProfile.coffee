Window = ->

	UI = require "/ui/Components"
	URL = require "/lib/URL"
	ProgressView = require "/lib/ProgressView"
	Properties = Ti.App.Properties

	rows = []
	progressView = new ProgressView()


	self = UI.createWindow
		titleid: "profile"

	# Create TableView HeaderView
	headerView = Ti.UI.createView
		height: 80
		width: Ti.UI.FILL

	# Profile image
	imageProfile = Ti.UI.createImageView
		left: 10
		width: 50
		height: 50
	headerView.add imageProfile

	# Name
	labelNameProfile = Ti.UI.createLabel
		left: 70
		right: 10
		top: 20
		shadowColor: "#FFFFFF"
		shadowOffset: { x: 0, y: 1}
		font: { fontSize: 18, fontWeight: "bold" }
	headerView.add labelNameProfile

	# Email
	labelEmailProfile = Ti.UI.createLabel
		left: 70
		right: 10
		top: 43
		shadowColor: "#FFFFFF"
		shadowOffset: { x: 0, y: 1}
		font: { fontSize: 14 }
	headerView.add labelEmailProfile

	tableView = UI.createTableView
		style: Ti.UI.iPhone.TableViewStyle.GROUPED
		headerView: headerView
	self.add tableView

	# Add ProgressView to Window
	self.add progressView

	# Methods
	getDataFromLocal = ->
		me = Properties.getObject "me"
		showProfileInTableView me


	getDataFromWS = ->
		xhr = Ti.Network.createHTTPClient
			onerror: ->
				getDataFromLocal()
			oncancel: ->
				getDataFromLocal()
			onload: ->
				profile = JSON.parse this.responseText
				Properties.setString "me", JSON.stringify profile
				
				showProfileInTableView profile

		xhr.open "GET", URL.getURL "me"
		xhr.send()


	getData = ->
		if Ti.Network.type == 0
			getDataFromLocal()
		else
			getDataFromWS()


	showProfileInTableView = (me) ->

		if me.image_url == null
			imageProfile.image = "/images/User.png"
		else
			imageProfile.image = me.image_url

		labelNameProfile.setText me.name
		labelEmailProfile.setText me.email

		sectionSettings = Ti.UI.createTableViewSection
			headerTitle: L("settings")

		# Push Notification
		pushNotificationTableViewRow = Ti.UI.createTableViewRow
			height: 44

		pushNotificationTableViewRow.add Ti.UI.createLabel
			textid: "receive_notifications"
			left: 10
			font: { fontSize: 16 }

		switchPushNotification = Ti.UI.createSwitch
			value: false
			right: 10
		pushNotificationTableViewRow.add switchPushNotification
		sectionSettings.add pushNotificationTableViewRow

		# Set TableView data
		tableView.setData [sectionSettings]

		# Hide ProgressView
		progressView._hide()


	# Events handler
	self.addEventListener "open", ->
		getData()


	self


module.exports = Window