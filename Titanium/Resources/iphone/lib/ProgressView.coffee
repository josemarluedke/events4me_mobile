class ProgressView

	constructor: (dict) ->

		# Prepare parameters
		defaults =
			colorLoadingView: "#000000"
			opacityLoadingView: 0.9
			radiusLoadingView: 6
			backgroundColor: "transparent"
			activityIndicatorStyle: Ti.UI.iPhone.ActivityIndicatorStyle.BIG
			bottomSpace: 0

		@dict = applyConfig defaults, dict

		return @createProgressView()

	createProgressView: ->
	
		self = @

		# Full View
		@progressView = Ti.UI.createView
			visible: true
			bottom: @dict.bottomSpace
			backgroundColor: @dict.backgroundColor

		# LoadingView
		@progressView.add Ti.UI.createView
			width: 100
			height: 100
			borderRadius: @dict.radiusLoadingView
			backgroundColor: @dict.colorLoadingView
			opacity: @dict.opacityLoadingView

		# ActivityIndicatorView
		activityIndicatorView = Ti.UI.createView
			width: 100
			height: 100

		# ActivityIndicator
		@activityIndicator = Ti.UI.createActivityIndicator
			style: @dict.activityIndicatorStyle

		@activityIndicator.show()
		activityIndicatorView.add @activityIndicator

		@progressView.add activityIndicatorView

		@progressView._show = ->
			@progressView.setVisible true

		@progressView._hide = ->
			self.progressView.animate { opacity: 0, duration: 300 }

			setTimeout ->
				self.progressView.setVisible false
			, 350

		return @progressView


module.exports = ProgressView

# CoffeeScript extends
applyConfig = (object, config) ->
	extend (extend {}, object), config

extend = exports.extend = (object, properties) ->
	for key, val of properties
		object[key] = val
	object