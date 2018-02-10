require 'pry'
require_relative 'scraper'
require_relative 'cli'

class WikihowTechTopics::WikihowTechTopicModel

    attr_accessor :title, :content, :url
   
    @@all = []

    def initialize(title = nil, content = nil, url = nil)
        @title = title
        @content = content
        @url = url
        @@all << self
    end

    def self.titles_from_title_array
        title_array = WikihowTechTopics::Scraper.get_titles_from_content_urls
        title_array.each do |title|
            self.new(title)
        end
    end

    def self.scraped_content_array
        content_array = WikihowTechTopics::Scraper.scraped_content_array
        content_array.each_with_index do |content, index|
            @@all[index].content = content
        end
    end
    
    def self.content_urls
        content_array = WikihowTechTopics::Scraper.get_content_urls
        content_array.each_with_index do |url, index|
            @@all[index].url = url
        end
    end

    def self.all
        @@all
    end
end
