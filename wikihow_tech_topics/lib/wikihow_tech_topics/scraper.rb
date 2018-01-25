require 'open-url'
require 'nokogiri'
require 'pry'

class Scraper

    need to set up array or hash for scraped info

    @article_hash = {}

    need to put the url that will be scraped with standard nokogiri code

    def self.scrape_home_page
        home_page = Nokogiri::HTML(open(https://www.wikihow.com/Category:Computers-and-Electronics))

        need to iterate over home page for specific information to fill out hash

        # <div class="text"><p>How to <br><span>Change Alexa's Name</span></p></div>

        home_page.css('p.span').each do |article|
    
        articles = {
            :title => article.css().text
        }
    end
    
end