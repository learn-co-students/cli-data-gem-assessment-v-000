# require_relative '../lib/scraper.rb'

require 'pry'

class WikihowTechTopics
    binding.pry

    attr_accessor :title, :content

    @@all = []

need to be able to create a new object from the attributes in hash and access them in class
how to access hash from Scraper to instantiate here?


    def initialize(title, content)
        @title = title
        @content = content  
        @@all << self
    end

    def self.get_scraped_info
    end

    def self.all
        @@all
    end
end