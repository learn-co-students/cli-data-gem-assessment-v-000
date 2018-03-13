class Match
  attr_accessor :name, :location, :entry_fee, :date, :description

  @@all = []

  def initialize
    @name = "2018 Berry's Steel Open"
    @@all << self
  end

  def self.new_from_practiscore
    Match.new
  end

  def self.show_matches
    @@all
  end
end
