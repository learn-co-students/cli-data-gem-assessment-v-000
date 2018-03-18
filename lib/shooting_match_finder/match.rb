class Match
  attr_accessor :name, :location, :entry_fee, :date, :description

  @@all = []

  def self.scrape_matches #This will go away once I build Scraper since all this logic will be encapsulated there. This is just a test hash builder method.
  match_details = {:name => "2018 Berry's Steel Open",
                   :date => "Sometime in April",
                   :location => "SUPS Range, St. George, UT"}
  end

  def initialize
    @@all << self
  end

  def self.new_from_practiscore #creates Matches and assigns them attributes based on a hash. Will call the Scraper class
    new_match = self.new
    match_details = self.scrape_matches #this will change to Scraper.scrape_matches once I've built the Scraper class.
    new_match.add_attributes(match_details)
  end

  def add_attributes(match_details_hash)
    match_details_hash.each {|key, value| self.send(("#{key}="), value)}
  end


  def self.show_matches
    @@all
  end
end
