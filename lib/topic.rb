require_relative "../lib/scraper.rb"

class Topic
  @@all = []
  attr_accessor :name
  def initialize(name)
    @name = name
    portals
    @@all << self
  end
  
  # def self.create_from_collection(students_array)
  #   students_array.each{|student|
  #     newstudent = self.new(student)
  #   }
    
  # end
  
  def self.create_by_selection
    Scraper.scrape_portals_page(@name)
    #creates an array of all portal links in the chosen topic
  end
  
  def self.portals
    rand_portal = Scraper.scrape_portals_page(@name).sample
    Portal.new(rand_portal)
  end
end