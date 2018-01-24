class Recipe::RecipesInfo

  attr_accessor :time, :servings, :ingredients, :instructions

  @@all = []

  def initialize
    @@all <<  self
  end

  def self.all
    @@all
  end


end
