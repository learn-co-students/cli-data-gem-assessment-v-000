#require 'scraper_module.rb'
require_relative "../lib/scraper.rb"
require 'pry'

class Fact
  #belongs_to Portal
  #finds a random fact
  #returns facts
  #need to add a mechanism to keep the same fact from being returned again
  attr_accessor :text, :url, :portal

  @@all = []
  def initialize(text)
    @text = text
    @@all << self
  end

  # def self.random
  #   return Scraper.scrape_portal_dyk(@url)
  # end

  def self.all
    #@@all_topics
    @@all
  end

  def self.find_or_create_by_text(text)
    if Fact.all.detect{|fact| fact.text}
      @fact = Fact.all.detect{|fact| fact.text}
    else
      @fact = Fact.new(text)
    end
  end

end
