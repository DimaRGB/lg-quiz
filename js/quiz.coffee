define

	renderQuestions: (data) ->
		'use strict';
		$quiz = $ '.quiz .questions'
		$question = $ '<div class="question"><li></li></div>'

		for question in data.questions
			$question
				.clone()
				.find('li').html(question).end()
				.appendTo($quiz)
		@

	run: ->
		'use strict';
		@
