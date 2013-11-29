define [
	'jquery'
], ($) ->

	init: ->
		$('.social-share')
			.find('.share-btn')
			.click (e) =>
				e.preventDefault()
				$el = $ e.target
				type = $el.data 'type'
				@socialShare type

	socialShare: (type) ->
		u = encodeURIComponent @propContent 'og:url'
		t = encodeURIComponent @propContent 'og:title'
		d = encodeURIComponent @propContent 'og:description'
		i = encodeURIComponent @propContent 'og:image'
		switch( type )
			when 'fb' then url = @fb u, t, d, i
			when 'vk' then url = @vk u, t, d, i
		if( url )
			name = "share_#{type}"
			specs = 'status=0,toolbar=0,location=0,menubar=0,width=800,height=500,resizable=1'
			window.open url, name, specs
		console.log url

	propContent: (prop) ->
		$('head')
			.find("meta[property='#{prop}']")
			.attr('content')

	fb: (u, t, d, i) ->
		'http://www.facebook.com/sharer/sharer.php' +
		'?s=100' +
		"&u=#{u}" +
		"&p[url]=#{u}" +
		"&p[title]=#{t}" +
		"&p[summary]=#{d}" +
		"&p[images][0]=#{i}"

	vk: (u, t, d, i) ->
		'http://vk.com/share.php' +
		"?url=#{u}" +
		"&title=#{t}" +
		"&description=#{d}" +
		"&image=#{i}"
