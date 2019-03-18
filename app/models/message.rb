class Message
  include Mongoid::Document

  field :context, type: String

  after_save :call_message_job

  def call_message_job
  	# binding.pry
  	MessageBroadcastJob.perform_later(self.context)
  end
end
