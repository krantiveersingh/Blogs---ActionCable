App.blogs = App.cable.subscriptions.create "BlogsChannel",
  connected: ->
  	console.log('connected')
    # Called when the subscription is ready for use on the server

  disconnected: ->
  	console.log('disconnected')
    # Called when the subscription has been terminated by the server

  received: (data) ->
  	$('.blogs_list').append data['message']
  	#alert(data['message'])
    # Called when there's incoming data on the websocket for this channel

  speak: (message) ->
    @perform 'speak', message: message

  $(document).on 'keypress', '[data-value~=blog_speaker]', (event) ->
	  if event.keyCode is 13
		  App.blogs.speak event.target.value
		  event.target.value = ''
		  event.preventDefault()