class Match
  attr_accessor :name, :location, :entry_fee, :date, :description

  @@all = []


  def initialize
    @@all << self
  end

  def self.new_from_practiscore #creates Matches and assigns them attributes based on a hash.
    ShootingMatchFinder::Scraper.scrape_matches.each do |match_details|
      new_match = self.new
      new_match.add_attributes(match_details)
    end
  end

  def add_attributes(match_details_hash)
    match_details_hash.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.show_matches
    @@all
  end
end
