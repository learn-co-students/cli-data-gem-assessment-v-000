require 'pry'
class Match
  attr_accessor :name, :location, :entry_fee, :date, :description, :match_url

  @@all = []


  def initialize
    @@all << self
  end

  def self.new_from_practiscore #creates Matches and assigns them attributes based on a hash.
    ShootingMatchFinder::Scraper.scrape_matches.each do |match_info|
      new_match = self.new
      #binding.pry
      new_match.add_attributes(match_info)
    end
  end

  def add_attributes(match_info)
    match_details.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.show_matches
    @@all
  end
end
