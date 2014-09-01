module Naobot::Webhook
  class Message

    attr_reader :channel, :user, :body

    def initialize(channel, user, text)
      @channel = channel.to_sym
      @user = user
      @body = text
    end

  end
end
