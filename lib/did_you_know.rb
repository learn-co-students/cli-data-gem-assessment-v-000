#require 'scraper_module.rb'
require_relative "../lib/scraper_module.rb"
require 'pry'

class DidYouKnow
  extend ScraperModule

  attr_accessor :name, :facts, :all_topics 
  
  @@all_viewed_facts = []
  def initialize
    @scrapepages = ScraperModule::Scraper.scrape_portals_page
    @scarpedyk = ScraperModule::Scraper.scrape_portal_dyk
    #@@all_topics = ScraperModule::Scraper.all.keys #maybe self.@@all.keys?
    @@all_viewed_facts << self
  end

  def self.create_from_collection
    @all_topics.each{|student|
      newstudent = self.new(student)
    }
  end

  def self.all_topics
    #@@all_topics
    return ScraperModule::Scraper.all.keys
  end
  
end