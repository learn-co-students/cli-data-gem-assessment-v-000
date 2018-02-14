class Topic
  extend ScraperModule
  @@all = []
  attr_accessor :name
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.create_from_collection(students_array)
    students_array.each{|student|
      newstudent = self.new(student)
    }
    
  end
  
  def self.create_by_selection
    ScraperModule::Scraper.scrape_portals_page(@name)
    #creates an array of all portal links in the chosen topic
  end
end