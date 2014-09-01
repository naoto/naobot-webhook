# encoding: utf-8

require 'cgi'
require 'google-search'

class GoogleSearch < Naobot::Webhook::Base
  def on_privmsg(message)
    if message.body =~ /(?<keyword>.+)探してきて/
      notice(message.to, search($~[:keyword]).first)
    end
  end

  private
    def search(keyword)
      Google::Search::Web.new(query: keyword, size: :small, language: :ja).map do |item|
        "#{CGI.unescapeHTML(item.title)} - #{item.uri}"
      end
    end
end

