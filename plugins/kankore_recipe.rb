require 'open-uri'
require 'nokogiri'

class KankoreRecipe < Naobot::Webhook::Base

  def on_privmsg(message)
    case message.body
    when /^recipe big\s?(.+)$/
      notice(message.to, recipe_big($1))
    when /^recipe\s?(.+)$/
      notice(message.to, recipe($1))
    end
  end

  def recipe_big(type)
  end

  def recipe(type)
    uri = "http://wikiwiki.jp/kancolle/?%B7%FA%C2%A4%A5%EC%A5%B7%A5%D4"
    html = Nokogiri::HTML(open(uri).read)

    recipes = []
    case type
    when html.at("h3#h3_content_1_2").content.toutf8.strip
      html.at("h3#h3_content_1_2 ~ div.ie5").search("tr").each do |tr|
        rec = [""]
        tr.search("td").each do |td|
          rec << td.content.toutf8
        end
        recipes << rec.join(" | ")
      end
    when html.at("h3#h3_content_1_3").content.toutf8.strip
      html.at("h3#h3_content_1_3 ~ div.ie5").search("tr").each do |tr|
        rec = [""]
        tr.search("td").each do |td|
          rec << td.content.toutf8
        end
        recipes << rec.join(" | ")
      end
    when html.at("h3#h3_content_1_4").content.toutf8.strip
      html.at("h3#h3_content_1_4 ~ div.ie5").search("tr").each do |tr|
        rec = [""]
        tr.search("td").each do |td|
          rec << td.content.toutf8
        end
        recipes << rec.join(" | ")
      end
    when html.at("h3#h3_content_1_5").content.toutf8.strip
      html.at("h3#h3_content_1_5 ~ div.ie5").search("tr").each do |tr|
        rec = [""]
        tr.search("td").each do |td|
          rec << td.content.toutf8
        end
        recipes << rec.join(" | ")
      end
    when html.at("h3#h3_content_1_6").content.toutf8.strip
      html.at("h3#h3_content_1_6 ~ div.ie5").search("tr").each do |tr|
        rec = [""]
        tr.search("td").each do |td|
          rec << td.content.toutf8
        end
        recipes << rec.join(" | ")
      end
    when html.at("h3#h3_content_1_7").content.toutf8.strip
      html.at("h3#h3_content_1_7 ~ div.ie5").search("tr").each do |tr|
        rec = [""]
        tr.search("td").each do |td|
          rec << td.content.toutf8
        end
        recipes << rec.join(" | ")
      end
    end
    recipes
  end

end
