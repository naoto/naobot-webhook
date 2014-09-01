require 'open-uri'
require 'nokogiri'
require 'kconv'

class KankoreSerif < Naobot::Webhook::Base

  def on_privmsg(message)
    case message.body
    when /^talk$/
      notice(message.to, scryp.sample)
    end
  end

  def scryp(ship = '%B2%C3%B2%EC')
    uri = "http://wikiwiki.jp/kancolle/?#{ship}"
    words = []
    Nokogiri::HTML(open(uri).read).search("td#rgn_content1 div.ie5 table tr td:nth-child(even)").each do |td|
      word = td.content.toutf8
      words << word unless word.strip == ""
    end
    words
  end

end
