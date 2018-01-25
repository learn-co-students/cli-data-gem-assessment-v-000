require 'open-url'
require 'nokogiri'
require 'pry'

class Scraper
binding.pry
    @article_hash = {}

    def self.scrape_home_page
        home_page = Nokogiri::HTML(open(https://www.wikihow.com/Category:Computers-and-Electronics))

        # <div class="text"><p>How to <br><span>Change Alexa's Name</span></p></div>

        home_page.css('div').each do |article|
    
        articles = {
            :title => article.css('p.span').text
        }

        @article_hash << articles
        
        end
    end
    
end