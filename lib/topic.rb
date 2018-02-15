require_relative "../lib/scraper.rb"

class Topic
  #has many Portals
  @@all = []
  attr_accessor :name
  def initialize(name)
    @name = name
    @portals = []
    @@all << self
  end
  
  # def self.create_from_collection(students_array)
  #   students_array.each{|student|
  #     newstudent = self.new(student)
  #   }
    
  # end
  
  def self.random_portal
    @rand_portal = Scraper.scrape_portals_page(@name).sample
    return Portal.new(@rand_portal)
  end
  
  def self.all
    return Scraper.all_topics
  end
  
  # def self.portals
  #   Portal.new()
  # end
  
  def add_portal(portal)
    @rand_portal = Scraper.scrape_portals_page(@name).sample
    @portals << portal
    portal.topic = self
  end
  
  def portals
    @portals
  end
end