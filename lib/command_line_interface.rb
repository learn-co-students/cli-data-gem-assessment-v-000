require_relative "../lib/scraper.rb"
require_relative "../lib/articles.rb"
require 'nokogiri'

class CommandLineInterface
  BASE_PATH = "http://www.mufon.com/ufo-news"

  def run
    article_info
  end

  def article_info
    article_array = Scraper.scrape_news_page(BASE_PATH)
    Article.create_from_collection(article_array)
  end

end
