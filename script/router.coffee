define [
  'backbone'
], (Backbone) ->

	Backbone.Router.extend

		routes:
			'': 'index'
			'*notFound': 'notFound'

		initialize: ->
	    console.log 'init router'

	  index: ->
	  	console.log 'index router'

	  notFound: ->
	  	console.log "Page not found: #{Backbone.history.fragment}"
