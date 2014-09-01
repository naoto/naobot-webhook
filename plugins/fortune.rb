# encoding: utf-8

require 'open-uri'
require 'nokogiri'

class Fortune < Naobot::Webhook::Base
  def on_privmsg(message)
    channel = message.to

    if message.body == 'おみくじ'
      sex = [
        'http://fortune.yahoo.co.jp/omikuji/result.html?sex=m',
        'http://fortune.yahoo.co.jp/omikuji/result.html?sex=f'
      ]

      fortunes = {}
      message  = ''

      html = Nokogiri::HTML(open(sex.sample))
      (html/'table/tr/td').each do |content|
        fortunes[$1] = $2 if content.inner_text =~ /^今日のあなたの(.+?)は(.+?)。/
      end

      fortunes.reverse_each do |genre, fortune|
        message << "#{genre}：#{fortune}　"
      end
      notice(channel, message)
    end
  end
end
