require 'pry'
require_relative 'scraper'
require_relative 'cli'


# Need to use this class to store instances of title and content as scraped by scraper

class WikihowTechTopics::WikihowTechTopicModel

    attr_accessor :title, :content
   
    def initialize(title=nil, content=nil)
        @title = title
        @content = content
        @@all << self
    end

    def self.create_from_title_hash
        new_title = WikihowTechTopics::Scraper.scraped_title_hash
        new_title.each {|key, value| self.send("#{key}=", value)}
            @@all << self
    end

    def self.create_from_content_hash
        new_content = WikihowTechTopics::Scraper.scraped_content_hash
        new_content.each {|key, value| self.send("#{key}=", value)}
            @@all << self
    end

    def self.all
        @@all
    end
end

# WikihowTechTopics::WikihowTechTopicModel.create_from_title_array
# WikihowTechTopics::WikihowTechTopicModel.create_from_content_array


    # def self.create_from_collection(students_array)
    #     students_array.each do |student_hash| 
    #     Student.new(student_hash)
    #     end
    # end
    
    # def add_student_attributes(attributes_hash)
    #     attributes_hash.each {|key, value| self.send("#{key}=", value)}
    #     @@all << self
    # end
    # def initialize(student_hash)
    #     student_hash.each {|key, value| self.send("#{key}=", value)}
    #     @@all << self
    #   end
    
    #   def self.create_from_collection(students_array)
    #     students_array.each do |student_hash| 
    #       Student.new(student_hash)
    #     end
    #   end
    
    #   def add_student_attributes(attributes_hash)
    #     attributes_hash.each {|key, value| self.send("#{key}=", value)}
    #     @@all << self
    #   end
    
    #   def self.all
    #     @@all@@all = []
