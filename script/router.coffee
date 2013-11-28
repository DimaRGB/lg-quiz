define [
	'jquery'
	'underscore'
	'backbone'
	'quiz'
], ($, _, Backbone, quiz) ->

	Backbone.Router.extend

		routes:
			'': 'index'
			'quiz': 'quiz'
			'addresses': 'addresses'
			'*notFound': 'notFound'

		initialize: ->
			console.log 'init router'

		render: (name, data) ->
			$template = $ "[type='text/template'][name='#{name}']"
			$('<div />')
				.attr('class', name)
				.addClass($template.attr 'data-class')
				.html(_.template $template.html(), data)

		renderContainer: (name, data) ->
			$('#container')
				.html @render name, data

		index: ->
			@renderContainer 'index'

		quiz: ->
			@renderContainer 'quiz'
			quiz
				.init()
				.setIndex(0)
				.run()

		addresses: ->
			@renderContainer 'addresses'

		notFound: ->
			console.log "Page not found: #{Backbone.history.fragment}"
