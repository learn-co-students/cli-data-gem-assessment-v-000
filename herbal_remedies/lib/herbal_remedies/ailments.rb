require_relative './scraper'

class Ailment

  attr_accessor :name, :remedy
  @@all = []

  def initialize#(name = nil, remedy = nil)
    #@name = name
    #@remedy = remedy
    @@all << self
  end

  def self.create_from_hash(a_r_hash)
    a_r_hash.each do |a, r|
      new_ailment = Ailment.new
      new_ailment.name = a
      new_ailment.remedy = r
    end
  end

  def self.all
    @@all
  end

#send(("#{name}="), name)
end

#Ailment.create_from_hash(Scraper.ailment_remedy_hash)
