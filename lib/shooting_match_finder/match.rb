class Match
  attr_accessor :name, :location, :entry_fee, :match_start, :description, :match_url

  @@all = []


  def initialize(match_hash) #takes in a hash to assign each match a name and a url for later use in #add_attributes.
    match_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.new_from_practiscore(match_array) #Uses the hash array passed in by cli.rb to create matches.
    match_array.each{|match_hash| Match.new(match_hash)}
  end

  def add_attributes(match_info) #takes in a hash and uses mass assignment to add match details.
    match_info.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.show_matches
    @@all
  end
end
