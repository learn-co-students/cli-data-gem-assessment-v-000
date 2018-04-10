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
  def initialize(url, text)
    @text = text
    @url = url
    @@all << self
  end

  # def self.random
  #   return Scraper.scrape_portal_dyk(@url)
  # end

  def self.all
    #@@all_topics
    @@all
  end

  def self.find_or_create_by_url(url)
    if Fact.all.detect{|fact| url == fact.url}
      @fact = Portal.all.detect{|fact| url == fact.url}
    else
      @fact = Portal.new(url)
      @@all << @fact
    end
  end

end
