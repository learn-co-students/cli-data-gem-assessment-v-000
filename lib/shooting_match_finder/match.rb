class Match
  attr_accessor :name, :location, :entry_fee, :date, :description

  @@all = []

  def initialize
    #I want to
    @name = "SUPS Practical Pistol"
    @date = "Sometime Soon"
    @description = "More info about how great this match will be!!!!"
    @@all << self
  end

  def self.new_from_practiscore
    Match.new
  end

  def self.show_matches
    @@all
  end
end
