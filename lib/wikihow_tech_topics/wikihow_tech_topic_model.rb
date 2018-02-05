require 'pry'
require_relative 'scraper'
require_relative 'cli'

class WikihowTechTopics::WikihowTechTopicModel

    attr_accessor :title
    attr_reader :home_page, :title_array, :content_array
   
    @@all = []

    def initialize(title = nil)
        @title = title
        @@all << self
    end
    
    def self.titles_from_title_array
        title_array = WikihowTechTopics::Scraper.scraped_title_array
        title_array.each do |title|
            self.new(title)
        end
    end

    def self.all
        @@all
    end
end

# WikihowTechTopics::Scraper.scraped_content_array
    # basic_computers_page = WikihowTechTopics::WikihowTechTopicModel.new
    # basic_computers_page.title = self.titles_from_title_array.each {|title| title}




# def self.create_from_title_array
#     # title_array.each do |title| 
#         WikihowTechTopics::WikihowTechTopicModel.new(title)
#     @@all << self
#     end
# end

# def add_content_from_content_array(content_array)
#     content_array.each do |content| 
#         WikihowTechTopics::WikihowTechTopicModel.new(title_array)
#     @@all << self        
#     end
# end


# def initialize(title=nil, content=nil)
#     @title = title
#     @content = content
#     @@all << self
# end

# def bob
#     binding.pry

#     bob = WikihowTechTopics::WikihowTechTopicModel.new

#     bob.title = boss
# end




# #     def initialize(title=nil, content=nil)
# #         @title = title
# #         @content = content
# #         @@all << self
# #     end

# #     def self.create_from_title_array
# #         title = WikihowTechTopics::WikihowTechTopicModel.new
# #         # new_title_array = 
# #         # WikihowTechTopics::Scraper.scraped_title_array.each do |title_from_array|
# #         # title = self.new(title_from_array)
# #         # title_from_array = self.title
# #         binding.pry

# #     end

# #     def self.create_from_content_array
# #         new_content_array = WikihowTechTopics::Scraper.scraped_content_array
# #         new_content_array.each do |content_from_array|
#         self.    content = self.new(content_from_array)
#             @@all << content
#             binding.pry

#         end
#     end



        # values_in_array = new_title_array.map {|hash| hash[:title]}

# WikihowTechTopics::Scraper.scraped_content_hash


        # new_title_array = [{key1 => value1}, {key2 => value2} ]

    # def self.create_from_collection(students_array)
    #     students_array.each do |student_hash| 
    #       Student.new(student_hash)
    #     end
    # end
    

    # def self.create_from_content_hash
    #     new_content = WikihowTechTopics::Scraper.scraped_content_hash
    #     new_content.each {|key, value| self.send("#{key}=", value)}
    #         @@all << self
    # end


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
