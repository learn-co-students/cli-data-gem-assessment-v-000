require 'pry'
class Match
  attr_accessor :name, :location, :entry_fee, :date, :description, :match_url

  @@all = []


  def initialize(match_hash)
    match_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.new_from_practiscore(match_array) #creates Matches and assigns them attributes based on a hash.
    match_array.each{|match_hash| Match.new(match_hash)}
  end

 # def add_attributes(match_info)
 #   match_info.each {|key, value| self.send(("#{key}="), value)}
 # end

  def self.show_matches
    @@all
  end
end
