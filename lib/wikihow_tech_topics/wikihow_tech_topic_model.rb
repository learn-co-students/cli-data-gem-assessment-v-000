require 'pry'
require_relative 'scraper'
require_relative 'cli'

class WikihowTechTopics::WikihowTechTopicModel

    attr_accessor :title, :content, :url
    # attr_reader :home_page, :title_array, :content_array
   
    @@all = []

    #iterating over scraper here for titles
    #instantiating urls for title

    def self.scraped_title_array
        home_page = Nokogiri::HTML(open("https://www.wikihow.com/Category:Selecting-and-Buying-a-Computer"))
        title_array = []
        home_page.css('.text').each do |title_info|
        info_for_title_array = title_info.css('span').text
        title_array << info_for_title_array
        #refactor out unneeded array?
        title_array.pop(5).each_with_index do |url, index|
            @@all[index].url = url
            end
        end
    end

    def initialize(title = nil, content = nil, url = nil)
        @title = title
        @content = content
        @url = url
        @@all << self
    end
    
    def self.titles_from_title_array
        title_array = WikihowTechTopics::Scraper.scraped_title_array
        title_array.each do |title|
            self.new(title)
        end
    end

    def self.content_from_content_array
        content_array = WikihowTechTopics::Scraper.scraped_content_array

        content_array.each_with_index do |content, index|
            @@all[index].content = content
        end
    end
    
    # def self.content_urls
    #     content_array = WikihowTechTopics::Scraper.scraped_content_array

    #     content_array.each_with_index do |content, index|
    #         @@all[index].content = content
    #     end
    # end

    def self.all
        @@all
    end
end