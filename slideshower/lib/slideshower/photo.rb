
class Photo

  attr_accessor :pictures, :name, :url, :picture

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
    #binding.pry
  end

  def self.reset_all
    @@all.clear
  end
end
