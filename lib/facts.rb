#require 'scraper_module.rb'
require_relative "../lib/scraper.rb"
require 'pry'

class Facts
  #belongs_to Portal
  #returns facts
  attr_accessor :name, :facts, :all
  
  @@all_viewed_facts = []
  def initialize
    @@all_viewed_facts << self
  end

  def self.random
    return Scraper.scrape_portal_dyk(topic_selection)
  end

  def self.all
    #@@all_topics
    @@all_viewed_facts
  end
  
end