require 'nokogiri'
require 'pry'
require 'open-uri'
require_relative 'wikihow_tech_topic_model'

class WikihowTechTopics::Scraper

    def self.scraped_title_hash

        # title_hash_array = []

        home_page = Nokogiri::HTML(open("https://www.wikihow.com/Category:Selecting-and-Buying-a-Computer"))

        home_page.css('.text').each do |title_info|

        title_hash = {
                :title => title_info.css('span').text
        }     
        
        # figure out why the return value of #scraped_title_hash is a Fixnum (0)
        # play with metaprogramming in Scraper
        # get control over understanding of what model is doing and get it to work
        # get the cli to output from model instances

        end
        # title_hash_array
    end

    # def self.scraped_content_hash

    #     content_hash = {}

    #     url = "https://www.wikihow.com/Category:Selecting-and-Buying-a-Computer"

    #     home_page = Nokogiri::HTML(open(url))
   
    #     content_urls = home_page.css(".thumbnail").children.css("a").map { |content_link| content_link.attribute("href").text }
        
    #     http_added = content_urls.map { |content_url| "https:" + content_url }

    #     http_added.map do |complete_content_url| 
    #         content_pages_to_scrape = Nokogiri::HTML(open(complete_content_url))
        
    #     final_scraped_content = content_pages_to_scrape.css('div.steps').map { |full_content|
    #             full_content.css("b").text }
        
    #     final_scraped_content.each do |steps|
    #         content_hash[:content] = steps
    #         end
    #     end
    #     content_hash
    # end
end

# WikihowTechTopics::Scraper.scraped_title_hash
# WikihowTechTopics::Scraper.scraped_content_hash

#putting into hash

# 1. Get more than just first article to be viewable by user
# 2. Finish out model and cli files for content
# 3. Parse/code steps from content to be user friendly
# 4. Make sure whole CLI works

# Question: Why did a below not need an argument of url but the current way does? (is the differenc each and map)? And was using each the reason I only got one link and a time and not all of the links scraped?)

# test_array = [{'title' => 'how to text', 'content' => 'just do it'}], {'title' => 'how to email', 'content' => 'just do it, too'}]


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
