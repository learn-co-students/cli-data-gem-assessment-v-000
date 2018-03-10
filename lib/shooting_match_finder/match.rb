class Match
  attr_accessor :name, :location, :entry_fee, :date, :description

  def initialize
    puts "1. 2018 Berry's Steel Open - Date"
    puts "You've initialized a new match! Here's all the info...."
  end

  def self.new_from_practiscore
    Match.new
  end
end
