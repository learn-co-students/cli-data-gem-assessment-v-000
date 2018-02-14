require_relative "../lib/scraper.rb"

class Portal
  attr_accessor :random_portal
  @@all = []
  def initialize(random_portal)
    @random_portal = random_portal
    @@all << self
    #receives the portal urls array from topic class
  end
  
  def self.all
    @@all
  end
  
end