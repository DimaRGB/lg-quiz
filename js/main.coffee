requirejs.config
	baseUrl: 'js/compiled'
	paths:
		jquery: [
			'http://code.jquery.com/jquery-1.10.2.min'
			'../jquery-1.10.2.min'
		]
		data: 'quiz-data'
		quiz: 'quiz'


requirejs ['jquery', 'data', 'quiz'], ($, _data, _quiz) -> $ ->
	'use strict';
	_quiz.init _data
	_quiz.renderFirstPage()
	_quiz.run()
