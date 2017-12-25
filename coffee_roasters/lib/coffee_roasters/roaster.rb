class CoffeeRoasters::Roaster
  attr_accessor :name, :location, :bean, :details, :url

  def self.all
    self.scrape_roasters
  end


  def self.scrape_roasters
    roasters = []

    roasters << self.scrape_thrillist

    roasters
  end


  def self.scrape_thrillist
    doc = Nokogiri::HTML(open("https://www.thrillist.com/drink/nation/the-21-best-coffee-roasters-in-the-country"))


    roaster = self.new
    roaster.name = doc.search("h1 a.save-venue__link").map(&:text)
    # roaster.name = doc.search("h1 a.save-venue__link").text
    roaster.location = doc.search("h2.save-venue__neighborhood").map(&:text)
    roaster.bean = doc.at("p.save-venue__description").text.split("\n")[0]
    roaster.details = doc.at("p.save-venue__description").text.split("\n")[2]
    roaster.url = doc.search("a.save-venue__link").attr("href").value
binding.pry
    roaster

  end

end
