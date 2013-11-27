requirejs.config
	baseUrl: 'js/compiled'
	paths:
		jquery: [
			'http://code.jquery.com/jquery-1.10.2.min'
			'../jquery-1.10.2.min'
		]
		backbone: 'backbone.min'
		data: 'quiz-data'
		quiz: 'quiz'
		share: '../custom-share'


requirejs ['jquery', 'backbone', 'data', 'quiz', 'share'], ($, _data, _quiz) -> $ ->
	'use strict';
	_quiz.init _data
	_quiz.setIndex 0
	_quiz.run()
