require_relative '../BitcoinLiterature'

class BitcoinLiterature::Document
  attr_accessor :name, :author, :date, :url
  @@all =[]

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.reset
    @@all = []
  end

end
