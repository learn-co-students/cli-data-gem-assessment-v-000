class Match
  attr_accessor :name, :location, :entry_fee, :date, :description

  @@all = []

  def initialize #(attributes) You'll need to pass in an argument of a hash for this to work.
    #I want to use mass assignment to give these match objects attributes. Some matches won't have all of these.
    #attributes.each {|key, value| self.send(("#{key}="), value)}
    #remember, you'll need to scrape into a hash for this to work.
    @name = "SUPS Practical Pistol"
    @date = "Sometime Soon"
    @description = "More info about how great this match will be!!!!"
    @@all << self
  end

  def self.new_from_practiscore
    #Eventually this will call on the Scraper class to create matches from Practiscore.
    Match.new
  end

  def self.show_matches
    @@all
  end
end
