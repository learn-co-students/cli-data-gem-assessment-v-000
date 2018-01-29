require 'pry'

class WikihowTechTopics::WikihowTechTopicModel

    attr_accessor :name, :title, :content

    @@all = []
    
    def initialize(name)
        @name = name
        @@all << self
    end
        
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
