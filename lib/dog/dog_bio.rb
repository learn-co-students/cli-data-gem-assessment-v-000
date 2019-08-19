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

end #end of class
