define

	index: -1

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
		isDone = !page.next
		animTime = 80

		@$quiz.find('.question')
			.fadeOut animTime, ->
				$(@).html page.question + ' ' + index
				$(@).fadeIn animTime

		$answers = @$quiz.find '.answers'
		$answers.fadeOut animTime, =>
			$answers.empty();
			for i in [0 .. page.answer.length - 1]
				next = if isDone then -1 else page.next[i]
				@appendAnswer page.answer[i], next, $answers
			$answers.fadeIn animTime, ->
				if isDone
					alert 'Quiz done !!!'

	appendAnswer: (answer, next, $answers) ->
		$('<div class="answer">' + answer + '</div>')
			.data('next', next)
			.appendTo($answers)

	run: ->
		'use strict'
		@$quiz.find('.answers').on 'click', '.answer', (e) =>
			next = parseInt($(e.target).data 'next')
			if ~next
				@renderPage next
			else
				console.log '!!!!!'
		@
