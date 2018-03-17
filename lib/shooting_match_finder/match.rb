class Match
  attr_accessor :name, :location, :entry_fee, :date, :description

  @@all = []

  def initialize
    @name = "SUPS Practical Pistol"
    @date = "Sometime Soon"
    @@all << self
  end

  def self.new_from_practiscore
    Match.new
  end

  def self.show_matches
    @@all
  end
end
