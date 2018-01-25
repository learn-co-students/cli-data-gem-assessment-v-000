# require_relative '../lib/scraper.rb'

require 'pry'

class WikihowTechTopics

    attr_accessor :title, :content

    @@all = []

need to be able to create a new object from the attributes in hash and access them in class


    def initialize(title, content)
        @title = title
        @content = content  
        @@all << self
    end

    def self.get_scraped_info
        Scraper.

        
    def self.all
        @@all
    end
end
    
    # will be called to run the program