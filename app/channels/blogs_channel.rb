class BlogsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "blogs_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  	# ActionCable.server.broadcast 'blogs_channel', message: data["message"]
  	Message.create!(context: data['message'])
  end
end
