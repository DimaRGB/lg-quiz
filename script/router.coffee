define [
	'jquery'
	'underscore'
	'backbone'
], ($, _, Backbone) ->

	Backbone.Router.extend

		routes:
			'': 'index'
			'quiz': 'quiz'
			'*notFound': 'notFound'

		initialize: ->
			console.log 'init router'

		render: (name, data) ->
			$template = $("[type='text/template'].#{name}")
			html = _.template $template.html(), data
			$('#content')
				.attr('class', $template.attr 'class')
				.html html

		index: ->
			@render 'index'

		quiz: ->
			@render 'quiz'

		notFound: ->
			console.log "Page not found: #{Backbone.history.fragment}"
