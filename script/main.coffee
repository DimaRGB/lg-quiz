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
		app:
			deps: ['backbone']


require [
	'jquery'
	'app'
], ($, app) -> $ ->
	'use strict'
	app.init()
