require 'pry'
# binding.pry
require_relative 'scraper'
require_relative 'cli'

class WikihowTechTopics::WikihowTechTopicModel

    attr_accessor :title, :content
   
    @@all = []

    def initialize(title=nil, content=nil)
        # @@all << []
        @title = title
        @content = content
        @@all << self
    end


    # def self.create_from_collection(students_array)
    #     students_array.each do |student_hash| 
    #       Student.new(student_hash)
    #     end
    # end
    
    def self.create_from_title_array
        # new_title_array = [{key1 => value1}, {key2 => value2} ]

        new_title_array = WikihowTechTopics::Scraper.scraped_title_hash
        binding.pry

        # new_scraper = WikihowTechTopics::Scraper.new
        # new_title_array = new_scraper.scraped_title_hash

        new_title_array.each do |title_hash|
            self.new(title_hash)
            @@all << self
        end
    end

    # def self.create_from_content_hash
    #     new_content = WikihowTechTopics::Scraper.scraped_content_hash
    #     new_content.each {|key, value| self.send("#{key}=", value)}
    #         @@all << self
    # end

    def self.all
        @@all
    end
end

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
