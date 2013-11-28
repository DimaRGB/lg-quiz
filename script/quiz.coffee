define [
	'jquery'
	'quiz-data'
], ($, data) ->

	init: ->
		'use strict'
		@index = -1
		@answerKey = '';
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
				@appendAnswer page.answer[i], next, i, $answers

			@renderDone() if isDone
			$answers.fadeIn animTime
		@

	appendAnswer: (answer, next, answerId, $answers) ->
		$('<div class="answer">' + answer + '</div>')
			.data('next', next)
			.data('answerId', answerId)
			.appendTo($answers)
		@

	renderDone: ->
		router.navigate '#/quiz/done'
		router
			.render('quiz-done')
			.appendTo($('#container'))
			.find('#category')
			.html(@getCategory())

	getCategory: ->
		answer = data.answers[@answerKey.slice 2]
		categoryId = answer[parseInt Math.random() * answer.length];
		data.categorys[categoryId]

	run: ->
		'use strict'
		@$quiz.find('.answers').on 'click', '.answer', (e) =>
			$el = $ e.target
			next = parseInt($el.data 'next')
			if ~next
				charCode = 'a'.charCodeAt(0) + parseInt($el.data 'answerId')
				@answerKey += String.fromCharCode charCode
				@setIndex next
			else
				router.navigate '#/addresses'
		@
