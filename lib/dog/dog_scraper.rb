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
  end

  def self.scrape_dog(dog_bio)
    f_url = "https://www.purina.com"+dog_bio.url
    doc = Nokogiri::HTML(open(f_url))
    dog_bio.bio = doc.search("section.mainContent p").text
  end
  
end #end of class
