require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
  article_array = []
  article_hash = {}
  html = File.read(index_url)
  doc = Nokogiri::HTML(html)

  doc.css("").each do |article|
    article_hash = {
      :title => article.css("h").text,
      :author => article.css("").text,
      :date => article.css("").text,
      :comments_url => article.css("@href").first.value,
    }
    article_array << article_hash
    end

    article_array

end
