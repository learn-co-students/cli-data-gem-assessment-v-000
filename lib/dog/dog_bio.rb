class Dog::DogBio
  attr_accessor :breed, :url, :bio

  @@all = []

  def initialize(breed, url)
    @breed = breed
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.dogs_usa
    @@all.select do |dog|
      dog.breed.include? "American"
    end
  end

end #end of class
