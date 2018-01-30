require 'nokogiri'
require 'pry'
require 'open-uri'


# test_array = [{'title' => 'how to text', 'content' => 'just do it'}], {'title' => 'how to email', 'content' => 'just do it, too'}]

class WikihowTechTopics::Scraper

    @title_ary = []

    @content_array = []

    def initialize(url = "https://www.wikihow.com/Category:Computers-and-Electronics")
        @url = url
    end

    def self.scraped_title_ary
        
        @home_page = Nokogiri::HTML(open("https://www.wikihow.com/Category:Computers-and-Electronics"))
        
        @home_page.css('.text').each do |title|
            title.css('span').text

        @title_ary << title.css('span').text
        end
        @title_ary
    end

    def self.scraped_content_array(content_url)

        
        url = "https://www.wikihow.com/Category:Computers-and-Electronics"

        home_page = Nokogiri::HTML(open(url))


        content_url = home_page.css(".thumbnail").each do |content|
            content.css("a").attribute("href").text


        end


        @content_url.css("div.bodycontents").text
            @content_array << @content_url.css("div.bodycontents").text
        @content_array
    end
end
#         content_url.css(<div class="thumbnail").each do |article|

#     end
# end

        # <div class="text"><p>How to <br><span>Change Alexa's Name</span></p></div>

        # <div class="thumbnail d-height d-width">
        # <a href="//www.wikihow.com/Change-Alexa%27s-Name">
        # <div id="bodycontents">

