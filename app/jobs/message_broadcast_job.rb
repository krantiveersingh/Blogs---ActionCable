class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
  	ActionCable.server.broadcast 'blogs_channel', message: render_message(message)
  end

  private

  def render_message(message)
  	ApplicationController.renderer.render(partial: 'blogs/blog', locals: { message: message })
  end
end
