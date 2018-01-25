# require_relative '../lib/scraper.rb'

require 'pry'

class WikihowTechTopics

    attr_accessor :title, :content

    @@all = []

need to be able to create a new object from the attributes in hash and access them in class
how to access hash from Scraper to instantiate here?


    def initialize(title, content)
        @title = title
        @content = content  
        @@all << self
    end

    def self.get_scraped_info_for_exec
        @article_hash.each_with_index {|attribute, index|

         I want to grab each attribute and value from scraped hash from Scraper and associate it with an index
         Then I want to represent that index and the attribute of title to be accessed in exec file
         The user will get hte index number and that will trigger the content

         number_selected = content.index
        
         number_selected = gets.strip

         

        }
    end

    def self.get_scraped_info
    end

    def self.all
        @@all
    end
end