require_relative '../BitcoinLiterature'

class BitcoinLiterature::Document
  attr_accessor :name, :author, :date
  @@all =[]

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.display_documents
    @@all.each_with_index do |document, index|
      puts "#{index +1} - #{document.name}"
    end
  end

  def display_documents_info
    puts "#{self.name} has been written by #{self.author} on #{self.date}"
  end

end
