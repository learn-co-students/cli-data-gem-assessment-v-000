require 'scraper_module.rb'
class Wikipedia
  extend ScraperModule

  attr_accessor :name, :facts, :all_topics 
  
  @@all_viewed_facts = []

  def initialize(category_name)
    @all_topics = Scraper.all.keys #maybe self.@@all.keys?
    @@all_viewed_facts << self
  end

  def self.create_from_collection
    @.each{|student|
      newstudent = self.new(student)
    }
  end

  def self.all_topics
    @all_topics
  end
  
end