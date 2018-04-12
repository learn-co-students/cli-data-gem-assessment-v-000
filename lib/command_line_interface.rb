require_relative "../lib/scraper.rb"
require_relative "../lib/articles.rb"
require 'nokogiri'

class CommandLineInterface
  BASE_PATH = "http://www.mufon.com/ufo-news"

  def initialize
    menu
  end

  def menu
    user_input = ""

    while while user_input != "exit"
      puts "Welcome to the MUFON News Scraper!"
      puts "What would you like to do?"
      puts "1. UFO news"
      puts "2. MUFON news"
      puts "3. List of the last 20 UFO Reports"
      puts "type exit to exit"

      user_input = gets.chomp.downcase

      case user_input
      when "1"
        Scraper.new(BASE_PATH)
        puts ""
        puts "Welcome to MUFON's UFO news"
        puts ""
        display_summary
      when "2"
        break
      end
    end
  end
  end

  def run
    article_info
  end

  def make_article
    article_array = Scraper.scrape_news_page(BASE_PATH)
    Article.create_from_collection(article_array)
  end

  def add_attributes_to_articles
    Article.all.each do |article|
      attributes = Scraper.scrape_news_page(BASE_PATH)
      # student.add_student_attributes(attributes)
    end
  end

  def display_summary
    counter = 0
    binding.pry
    Article.all.each do |article|
      counter += 1
      binding.pry
      puts "#{counter}. #{article.article_title}  -  #{article.article_date}"
    end
  end

end
