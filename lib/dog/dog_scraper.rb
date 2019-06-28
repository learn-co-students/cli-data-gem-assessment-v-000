require 'pry'
class Dog::DogScraper
  attr_accessor :breed, :bio

  def self.list
    scrape_dogs
  end

  def self.scrape_dogs
    dogs = []

    dogs << self.scrape_eskimo
    dogs << self.scrape_pug
    dogs << self.scrape_bernese
    dogs << self.scrape_bulldog

    dogs
  end

  def self.scrape_eskimo
    doc = Nokogiri::HTML(open("https://www.purina.com/dogs/dog-breeds/american-eskimo-dog"))

    breed = doc.search("h1").text
    bio = doc.search("section.mainContent p").text

    Dog::DogBio.new(breed, bio)
  end

  def self.scrape_pug
    doc = Nokogiri::HTML(open("https://www.purina.com/dogs/dog-breeds/pug"))


    breed = doc.search("h1").text
    bio = doc.search("section.mainContent p").text

    Dog::DogBio.new(breed, bio)
  end

  def self.scrape_bernese
    doc = Nokogiri::HTML(open("https://www.purina.com/dogs/dog-breeds/bernese-mountain-dog"))

    breed = doc.search("h1").text
    bio = doc.search("section.mainContent p").text

    Dog::DogBio.new(breed, bio)
  end

  def self.scrape_bulldog
    doc = Nokogiri::HTML(open("https://www.purina.com/dogs/dog-breeds/bulldog"))

    breed = doc.search("h1").text
    bio = doc.search("section.mainContent p").text

    Dog::DogBio.new(breed, bio)
  end

  def new_file
    File.new "out.txt"
  end

  def saved_dogs
    File.open("out.txt", "w") do |f|
      f.write(list)
    end
  end

end
