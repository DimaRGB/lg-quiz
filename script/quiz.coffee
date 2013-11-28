define [
	'jquery'
	'quiz-data'
], ($, data) ->

	init: ->
		'use strict'
		@index = -1
		@maxIndex = data.pages.length
		@$quiz = $ '.quiz'
		@$quiz.removeClass 'spinner'
		@

	setIndex: (index) ->
		'use strict'
		return if index == @index || index < 0 || index > @maxIndex
		@index = index
		page = data.pages[index]
		@renderPage page, !page.next, 100
		@

	renderPage: (page, isDone, animTime) ->
		'use strict'
		$question = @$quiz.find '.question'
		$answers = @$quiz.find '.answers'

		$question.fadeOut animTime
		$answers.fadeOut animTime, =>
			$question
				.html('Level ' + page.level + ': ' + page.question)
				.fadeIn animTime

			$answers.empty()
			for i in [0 .. page.answer.length - 1]
				next = if isDone then -1 else page.next[i]
				@appendAnswer page.answer[i], next, $answers
			$answers.fadeIn animTime, ->
				if isDone
					$('#container')
						.append(router.render 'quiz-done')
		@

	appendAnswer: (answer, next, $answers) ->
		$('<div class="answer">' + answer + '</div>')
			.data('next', next)
			.appendTo($answers)
		@

	run: ->
		'use strict'
		@$quiz.find('.answers').on 'click', '.answer', (e) =>
			next = parseInt($(e.target).data 'next')
			if ~next
				@setIndex next
			else
				router.navigate '#/addresses'
		@
