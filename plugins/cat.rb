#-*- coding: utf-8

require 'nokogiri'
require 'open-uri'
require 'json'

class Cat < Naobot::Webhook::Base

  THE_CAT_API = "http://thecatapi.com/api/images/get?format=src&type=gif"
  NEKOSTAGRAM = "http://nekostagram.heroku.com/"

  def on_privmsg(message)
    case message.body
    when /^cat/
      notice message.to, never
    end
  end

  def thecatapi
    open(THE_CAT_API).base_uri
  end

  def nekostagram
    JSON.parse(open(NEKOSTAGRAM, "Accept" => "application/json").read)["data"].sample["images"]["standard_resolution"]["url"]
  end

  def nekocat
    cat = []
    open("http://c.wlkr.jp/items/index/page:#{[*1...20].sample}"){ |f| 
      f.each { |line| 
        cat << $1 if line =~ /(http:\/\/farm\d.static.flickr.com.+jpg)/
      } 
    }
    cat.sample.gsub(/_m.jpg/, '_z.jpg')
  end

  def never
    Nokogiri::HTML(open("http://matome.naver.jp/odai/2137311847461549001?page=#{[*1...16].sample}").read).xpath("//img[@class='MTMItemThumb']").map { |m| 
      URI.decode(m["src"].gsub("http://rr.img.naver.jp:80/mig?src=",'').gsub(/.jpg.+$/,'.gif'))
    }.sample
  end

end
