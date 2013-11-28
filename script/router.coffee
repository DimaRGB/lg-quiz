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
			'quiz/restart': 'quizRestart'
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

		navigateReplace: (url) ->
    	@navigate url, trigger: true, replace: true

		renderContainer: (name, data) ->
			$('#container')
				.html @render name, data

		index: ->
			@renderContainer 'index'

		quiz: ->
			@renderContainer 'quiz'
			quiz.init()
			quiz.setIndex(0)
			quiz.run()

		quizRestart: ->
			@navigateReplace 'quiz'

		addresses: ->
			@renderContainer 'addresses'

		notFound: ->
			console.log "Page not found: #{Backbone.history.fragment}"
