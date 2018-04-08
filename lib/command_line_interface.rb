require_relative "../lib/scraper.rb"
require_relative "../lib/student.rb"
require 'nokogiri'

class CommandLineInterface
  BASE_PATH = "http://www.mufon.com/ufo-news"


  def article_info
    article_array = Scraper.scrape_news_page(BASE_PATH + "/ufo-news")
  end

end
