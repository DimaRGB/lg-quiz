requirejs.config
	baseUrl: 'js/compiled'
	paths:
		jquery: [
			'http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min'
			'../jquery-1.10.2.min'
		]
		data: 'quiz-data'
		quiz: 'quiz'


requirejs ['jquery', 'data', 'quiz'], ($, _data, _quiz) ->
	'use strict';
	_quiz.renderQuestions _data
	_quiz.run()
	@
