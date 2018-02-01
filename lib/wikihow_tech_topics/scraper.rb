require 'nokogiri'
require 'pry'
require 'open-uri'
require_relative 'wikihow_tech_topic_model'



# test_array = [{'title' => 'how to text', 'content' => 'just do it'}], {'title' => 'how to email', 'content' => 'just do it, too'}]

class WikihowTechTopics::Scraper

    @title_ary = []

    @content_array = []

    def initialize(url = "https://www.wikihow.com/Category:Selecting-and-Buying-a-Computer")
        @url = url
    end

    def self.scraped_title_array
        
        @home_page = Nokogiri::HTML(open("https://www.wikihow.com/Category:Selecting-and-Buying-a-Computer"))
        
        @home_page.css('.text').each do |title|
            title.css('span').text

        @title_ary << title.css('span').text
        end
        @title_ary
    end




    def self.scraped_content_array(url)

        # @content_url = content_url

        url = "https://www.wikihow.com/Category:Selecting-and-Buying-a-Computer"

        home_page = Nokogiri::HTML(open(url))

        # link = profile_page.css("div.social-icon-container").children.css("a").map { |sm| sm.attribute("href").text }
    
        content_urls = home_page.css(".thumbnail").children.css("a").map { |content_link| content_link.attribute("href").text }
        # css('div.steps')
        content_urls.map do |complete_content_url| 
            content_pages_to_scrape = Nokogiri::HTML(open(complete_content_url))}
        
        @content_array = content_pages_to_scrape.css('div.steps').map {|full_content|
                full_content.css("b").text
        
        @content_array
        
            binding.pry
    end
end



# 1. Get more than just first article to be viewable by user
# 2. Finish out model and cli files for content
# 3. Parse/code steps from content to be user friendly
# 4. Make sure whole CLI works

# Question: Why did a below not need an argument of url but the current way does? (is the differenc each and map)? And was using each the reason I only got one link and a time and not all of the links scraped?)

# home_page.css(".thumbnail").each do |content_url|
#     content_url.css("a").attribute("href").text

# scraped_content_ary = []

# scraped_content_url = content_url.css("a").attribute("href").text

# scraped_content_ary << "https:" + scraped_content_url

# scraped_content_ary.each do |complete_content_url|
#     content_page = Nokogiri::HTML(open(complete_content_url))

# content_page.css('div.steps').each do |full_content|
#     full_content.css("b").text
#     @content_array << full_content.css("b").text
#     binding.pry
