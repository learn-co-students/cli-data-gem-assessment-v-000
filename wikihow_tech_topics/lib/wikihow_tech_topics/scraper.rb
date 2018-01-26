require 'open-url'
require 'nokogiri'
require 'pry'

class Scraper

    article_hash = {}

    def self.scraped_title_and_content(article_hash)
        home_page = Nokogiri::HTML(open(https://www.wikihow.com/Category:Computers-and-Electronics))
        
        content_url = Nokogiri::HTML(open(https://www.wikihow.com/Category:Computers-and-Electronics))

        home_page.css(<div class="thumbnail").each do |article|
    
        articles = {
            :title => article.css('p.span').text
            :content_url => article.css( <a href="//www.wikihow.com/Change-Alexa%27s-Name">).text
        }

        article_hash << articles
    end
    article_hash    
end

        # <div class="text"><p>How to <br><span>Change Alexa's Name</span></p></div>

        # <div class="thumbnail d-height d-width">
        # <a href="//www.wikihow.com/Change-Alexa%27s-Name">
        # <div id="bodycontents">

