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
  
  def find_random_portal_page
    find_rand_portal = Scraper.scrape_portals_page(@name).sample
    @create_portal = Portal.new(find_rand_portal)
    return @create_portal
  end
  
  def self.all
    return Scraper.all_topics
  end
  
  # def self.portals
  #   Portal.new()
  # end
  
  def add_portal
    new_portal = self.find_random_portal_page
    @portals << new_portal
    new_portal.topic = self
  end
  
  def portals
    @portals
  end
end