# encoding: utf-8

require 'open-uri'
require 'nokogiri'

class Wikipedia < Naobot::Webhook::Base
  def on_privmsg(message)
    channel = message.to
    message = message.body
    if message =~ /(?<keyword>.+)って(何|なに|誰|だれ)$/
      index($~[:keyword]).each do |result|
        notice(channel, result)
      end
    end
  rescue
    notice(channel, 'Not Found')
  end

  private
    def index(keyword)
      begin
        url = URI.escape("http://ja.wikipedia.org/wiki/#{keyword}")
      rescue
        url = search(keyword)
      end

      html = Nokogiri::HTML(open(url).read)
      [html.search('p').first.inner_text[0..300], url]
    end

    def search(keyword)
      body = Nokogiri::HTML(open(URI.escape("http://ja.wikipedia.org/w/index.php?title=特別%3A検索&search=#{keyword}")))
      search_results = body.search('ul.mw-search-results')
      unless search_results.nil?
        url = "http://ja.wikipedia.org#{search_results.search('a').first.attributes['href']}"
      else
        url = URI.escape("http://ja.wikipedia.org/wiki/#{body.at('#firstHeading').inner_text}")
      end
    end
end
