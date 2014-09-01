require 'twitter'

class Tweet < Naobot::Webhook::Base

  def initialize(*args)
    super
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
  end

  def on_privmsg(message)
    if /^(twit\s|@)+([^\s]+)[\s]{0,}([\d]{0,})/ =~ message.body
      user = $2
      cnt = $3.to_i || 0

      twit = "#{user}: #{@client.user_timeline(user)[cnt].text.gsub(/\n/, ' ')}"
      notice(message.to, twit)
    end

  rescue => e
    notice(message.to, e.to_s)
  end
end
