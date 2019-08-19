class Dog::DogScraper
  attr_accessor :breed, :bio

  def self.list
    scrape_dogs
  end

  def self.scrape_dogs
    doc = Nokogiri::HTML(open("https://www.purina.com/dogs/dog-breeds"))
    dogs = doc.search("div.blocks div.callout")
    dogs.each do |dog|
      breed = dog.search("span.callout-label").text
      url = dog.search("a.link").attr("href").value
      Dog::DogBio.new(breed, url)
    end
    # Dog::DogBio.new("Eskimo","https://www.purina.com/dogs/dog-breeds/american-eskimo-dog")
    # Dog::DogBio.new("Pug","https://www.purina.com/dogs/dog-breeds/pug")
    # Dog::DogBio.new("Bernese", "https://www.purina.com/dogs/dog-breeds/bernese-mountain-dog")
    # Dog::DogBio.new("Bulldog","https://www.purina.com/dogs/dog-breeds/bulldog")
  end

  def self.scrape_dog(dog_bio)
    f_url = "https://www.purina.com"+dog_bio.url
    doc = Nokogiri::HTML(open(f_url))
    dog_bio.bio = doc.search("section.mainContent p").text
  end

  #
  # breed = doc.search("h1").text
  # def self.scrape_pug
  #   doc = Nokogiri::HTML(open("https://www.purina.com/dogs/dog-breeds/pug"))
  #
  #   breed = doc.search("h1").text
  #   bio = doc.search("section.mainContent p").text
  #
  #   Dog::DogBio.new(breed, bio)
  # end
  #
  #
  # def self.scrape_bernese
  #   doc = Nokogiri::HTML(open("https://www.purina.com/dogs/dog-breeds/bernese-mountain-dog"))
  #
  #   breed = doc.search("h1").text
  #   bio = doc.search("section.mainContent p").text
  #
  #   Dog::DogBio.new(breed, bio)
  #
  # end
  #
  # def self.scrape_bulldog
  #   doc = Nokogiri::HTML(open("https://www.purina.com/dogs/dog-breeds/bulldog"))
  #
  #   breed = doc.search("h1").text
  #   bio = doc.search("section.mainContent p").text
  #
  #   Dog::DogBio.new(breed, bio)
  # end

  # def new_file
  #   File.new "out.txt"
  # end
  #
  # def saved_dogs
  #   File.open("out.txt", "w") do |f|
  #     f.write(list)
  #   end
  # end
end #end of class
