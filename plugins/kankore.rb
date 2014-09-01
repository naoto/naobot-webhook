#-*- coding: utf-8

require 'open-uri'
require 'json'

class Kankore < Naobot::Webhook::Base

  def initialize(*args)
    super
    @ships = JSON.parse(open("http://kankore-card.herokuapp.com/ships").read)
  end

  def on_privmsg(message)
    case message.body
    when /^(艦|かん)(これ|コレ)$/
      json = JSON.parse(open("http://kankore-card.herokuapp.com/kankore").read)
      data = JSON.parse(open(URI.escape("http://kankore-card.herokuapp.com/ship/#{json["name"]}")).read)
      begin
        notice(message.to, "#{json["name"]}: #{json["url"]}\n#{data["rarity"]}:#{data["sereas"]} #{data["sereas_num"]} #{data["type"]} #{data["next_biko"]}\n#{data["biko"]}")
      rescue
        notice(message.to, "#{json["name"]}: #{json["url"]}")
      end
    when *@ships
      image = URI.escape("http://kankore-card.herokuapp.com/image/#{message.body}.png")
      data = JSON.parse(open(URI.escape("http://kankore-card.herokuapp.com/ship/#{message.body}")).read)
      notice(message.to, "#{message.body}: #{image}\n#{data["rarity"]}:#{data["sereas"]} #{data["sereas_num"]} #{data["type"]} #{data["next_biko"]}\n#{data["biko"]}")
    end
  end

end
