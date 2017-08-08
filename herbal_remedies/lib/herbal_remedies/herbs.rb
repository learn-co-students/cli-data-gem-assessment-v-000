require_relative './scraper'

class Herbs

  attr_accessor :name, :path, :medicinal_uses, :properties, :preparation
  @@all = []

  def initialize
    @@all << self
  end

  def self.create_from_hash(herbs_and_path_hash)
    herbs_and_path_hash.each do |herb, h_path|
      new_herb = Herbs.new
      new_herb.name = herb
      new_herb.path = h_path
      binding.pry
    end
  end

  def self.all
    @@all
  end


end

binding.pry
Herbs.create_from_hash(Scraper.herb_names_and_path_hash)
