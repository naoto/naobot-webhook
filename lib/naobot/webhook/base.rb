module Naobot::Webhook
  class Base


    def initialize
      @response = {}
    end

    def notice(channel, message)
      @response[channel.to_sym] << message
    end

    def result(channel)
      res = @response[channel] || []
      @response[channel] = []
      res
    end
  end
end
