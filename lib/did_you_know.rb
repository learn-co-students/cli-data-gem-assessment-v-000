#require 'scraper_module.rb'
require_relative "../lib/scraper_module.rb"
require 'pry'

class DidYouKnow
  extend ScraperModule #::Scraper

  attr_accessor :name, :facts, :all
  
  @@all_viewed_facts = []
  def initialize
    @scrapepages = ScraperModule::Scraper.scrape_portals_page
    @scarpedyk = ScraperModule::Scraper.scrape_portal_dyk(topic_selection)
    #@@all_topics = ScraperModule::Scraper.all.keys #maybe self.@@all.keys?
    @@all_viewed_facts << self
  end

  def self.facts
    # @all_topics.each{|student|
    #   newstudent = self.new(student)
    # }
    #binding.pry
    return ScraperModule::Scraper.scrape_portal_dyk(topic_selection)
  end

  def self.all
    #@@all_topics
    return ScraperModule::Scraper.all_topics
  end
  
end