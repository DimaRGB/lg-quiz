define

	index: -1
	animTime: 80

	init: (@data = {}) ->
		'use strict'
		@maxIndex = @data.pages.length
		@$quiz = $ '.quiz'
		@$quiz.removeClass 'spinner'
		@

	renderPage: (index) ->
		'use strict'
		return if index == @index || index < 0 || index > @maxIndex
		@index = index
		page = @data.pages[@index]

		@$quiz.find('.question')
			.fadeOut @animTime, ->
				$(@).html page.question
				$(@).fadeIn()

		$answers = @$quiz.find '.answers'
		$answers.fadeOut @animTime, =>
			$answers.empty();
			for answer in page.answers
				@appendAnswer answer, $answers
			$answers.fadeIn();

	appendAnswer: (answer, $answers) ->
		$('<div class="answer">' + answer + '</div>')
			.appendTo($answers)

	renderFirstPage: ->
		'use strict'
		@renderPage 0

	renderNextPage: ->
		'use strict'
		@renderPage @index + 1

	renderPrevPage: ->
		'use strict'
		@renderPage @index - 1

	run: ->
		'use strict'
		@$quiz.find('.answers').on 'click', '.answer', =>
			@renderNextPage()
		@
