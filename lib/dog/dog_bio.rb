require 'pry'
class Dog::DogBio
  attr_accessor :breed, :bio

  @@all = []

  def initialize(breed, bio)
    @breed = breed
    @bio = bio
    @@all << self
  end


  def self.all
    @@all
  end
  

end
