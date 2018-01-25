require 'open-url'
require 'nokogiri'
require 'pry'

require_relative 'scraper'

class Scraper
binding.pry
    @article_hash = {}

    def self.scrape_home_page_for_title
        home_page = Nokogiri::HTML(open(https://www.wikihow.com/Category:Computers-and-Electronics))

        # <div class="text"><p>How to <br><span>Change Alexa's Name</span></p></div>

        do on same page for later

        # <div class="thumbnail d-height d-width">
        # <a href="//www.wikihow.com/Change-Alexa%27s-Name">
        # <div id="bodycontents">
    def self.scrape_linked_page_for_content
        
        home_page = Nokogiri::HTML(open(https://www.wikihow.com/Category:Computers-and-Electronics))

        home_page.css(<div class="thumbnail").each do |article|
    
        articles = {
            :title => article.css('p.span').text
            :content_url => article.css( <a href="//www.wikihow.com/Change-Alexa%27s-Name">).text
        }

        @article_hash << articles
    end    
end