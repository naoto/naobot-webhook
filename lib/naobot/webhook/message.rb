module Naobot::Webhook
  class Message

    attr_reader :to, :user, :body

    def initialize(channel, user, text)
      @to = channel.to_sym
      @user = user
      @body = text
    end

  end
end
