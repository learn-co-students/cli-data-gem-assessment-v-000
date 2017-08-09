require_relative './scraper'

class Herbs

  attr_accessor :name, :path, :medicinal_uses, :properties, :preparation
  @@all = []

  def initialize
    @@all << self
  end

  def self.create_herbs_from_hash(herbs_and_path_hash)
    herbs_and_path_hash.each do |herb, h_path|
      new_herb = Herbs.new
      new_herb.name = herb
      new_herb.path = h_path
    end
  end

  def add_herb_attributes(herb_attributes_hash)
    herb_attributes_hash.each do |key, value|
      self.send(("#{key}="), value)
    end
    self
  end

  def self.all
    @@all
  end

end

#Herbs.create_herb_from_hash(Scraper.herb_names_and_path_hash)
