require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_news_page(news_url)
  article_array = []
  article_hash = {}
  html = open(news_url)
  doc = Nokogiri::HTML(html)
  # binding.pry

  doc.css(".blog-post").each do |article|
    # binding.pry
    article_hash = {
      :title => article.css(".blog-title-link").text,
      :date => article.css(".blog-date").text,
      # :description => article.css(".blog-title-link").text,
      :story => article.css(".paragraph").text,
      :comments_url => article.css(".blog-comments a @href").first.value,
    }
    binding.pry
    article_array << article_hash

    end
binding.pry
    article_array
  end

end
