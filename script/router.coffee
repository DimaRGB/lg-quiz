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
			'*notFound': 'notFound'

		initialize: ->
			console.log 'init router'

		render: (name, data) ->
			$template = $("[type='text/template'][name='#{name}']")
			html = _.template $template.html(), data
			$('#content')
				.attr('class', name)
				.addClass($template.attr 'data-class')
				.html html

		index: ->
			@render 'index'

		quiz: ->
			@render 'quiz'
			quiz
				.init()
				.setIndex(0)
				.run()

		notFound: ->
			console.log "Page not found: #{Backbone.history.fragment}"
