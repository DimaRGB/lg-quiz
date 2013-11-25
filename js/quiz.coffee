define

	index: -1

	init: (@data = {}, @number = 4, @$quiz = $ '.quiz') ->
		'use strict'
		@maxIndex = @data.questions.length / @number ^ 0
		@maxIndex-- if !(@data.questions.length % @number)
		@$quiz.find('.questions').height(16 * @number);
		@

	renderPage: (index) ->
		'use strict'
		return if index == @index || index < 0 || index > @maxIndex

		@index = index
		x = @index * @number
		n = @number

		$questions = @$quiz.find '.questions'
		$questions.empty();
		while( x < @data.questions.length && n-- )
			@appendQuestion $questions, @data.questions[x++]
		@

	appendQuestion: ($questions, question) ->
		$('<div class="question"><li>' + question + '</li></div>')
			.appendTo($questions)

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
		@$quiz.find('.arrow.prev').on 'click', =>
			@renderPrevPage()
		@$quiz.find('.arrow.next').on 'click', =>
			@renderNextPage()
		@
