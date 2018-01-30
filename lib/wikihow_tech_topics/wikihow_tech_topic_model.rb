require 'pry'

# Need to use this class to store instances of title and content as scraped by scraper

class WikihowTechTopics::WikihowTechTopicModel

    attr_accessor :title, :content

    @@all = []
    
    def initialize(title=nil, content=nil)
        @title = title
        @content = content
        @@all << self
    end

    def self.create_from_title_array
        new_title = WikihowTechTopics::Scraper.get_title_ary
        new_title.each do |title|
        @@all << self.new(title)
        end
    end
    binding.pry

    def self.all
        @@all
    end

end

    # def self.create_from_collection(students_array)
    #     students_array.each do |student_hash| 
    #     Student.new(student_hash)
    #     end
    # end
    
    # def add_student_attributes(attributes_hash)
    #     attributes_hash.each {|key, value| self.send("#{key}=", value)}
    #     @@all << self
    # end
