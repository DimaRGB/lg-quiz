require.config
	paths:
		jquery: '../lib/jquery-1.10.2.min'
		underscore: '../lib/underscore.min'
		backbone: '../lib/backbone.min'
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
