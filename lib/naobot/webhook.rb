require "naobot/webhook/version"

module Naobot
  module Webhook
    # Your code goes here...
    require 'json'
    require 'rinne'
    require 'sinatra/base'

    require 'naobot/webhook/base'
    require 'naobot/webhook/plugin'
    require 'naobot/webhook/server'
    require 'naobot/webhook/message'
    require 'naobot/webhook/option'

    def self.start(option)
      Naobot::Webhook::Server.run!(Option.new(option))
    end

  end
end
