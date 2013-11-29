require.config
	paths:
		jquery: [
			'http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min'
			'../lib/jquery.min'
		]
		underscore: [
			'http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min'
			'../lib/underscore.min'
		]
		backbone: [
			'http://cdnjs.cloudflare.com/ajax/libs/backbone.js/1.1.0/backbone-min'
			'../lib/backbone.min'
		]
	shim:
		underscore:
			exports: '_'
		backbone:
			deps: ['jquery', 'underscore']
			exports: 'Backbone'


require [
	'jquery'
	'router'
], ($, Router) -> $ ->
	'use strict'
	window.router = new Router
	Backbone.history.start()
