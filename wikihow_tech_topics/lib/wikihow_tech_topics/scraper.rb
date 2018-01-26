require 'open-url'
require 'nokogiri'
require 'pry'


# test_array = [{'title' => 'how to text', 'content' => 'just do it'}], {'title' => 'how to email', 'content' => 'just do it, too'}]

class Scraper

    article_array = []
    
    def self.scraped_title_and_content(article_hash)
        home_page = Nokogiri::HTML(open(https://www.wikihow.com/Category:Computers-and-Electronics))
        
        content_url = Nokogiri::HTML(open(https://www.wikihow.com/Category:Computers-and-Electronics))

        home_page.css(<div class="thumbnail").each do |article|
    
        articles = {
            :title => article.css('p.span').text
            :content_url => article.css( <a href="//www.wikihow.com/Change-Alexa%27s-Name">).text
        }

        article_array << articles
    end
    article_array    
end

        # <div class="text"><p>How to <br><span>Change Alexa's Name</span></p></div>

        # <div class="thumbnail d-height d-width">
        # <a href="//www.wikihow.com/Change-Alexa%27s-Name">
        # <div id="bodycontents">

