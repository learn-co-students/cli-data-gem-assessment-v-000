class CoffeeRoasters::Roaster
  attr_accessor :name, :location, :bean, :details, :url

  @@all = []

  def initialize(name, location, bean, details, url)
    @name = name
    @location = location
    @bean = bean
    @details = details
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end
  
end
