class CoffeeRoasters::Roaster
  attr_accessor :name, :location, :bean, :details, :url

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  # def self.scrape_thrillist
  #   doc = Nokogiri::HTML(open("https://www.thrillist.com/drink/nation/the-21-best-coffee-roasters-in-the-country"))
  #
  #   section = doc.css(".save-venue")
  #   section.each do |data|
  #
  #     roaster = self.new
  #     roaster.name = data.css("h1 a.save-venue__link").text
  #     roaster.location = data.css("h2.save-venue__neighborhood").text
  #     roaster.bean = data.css("p.save-venue__description").text.split("\n")[0]
  #     roaster.details = data.css("p.save-venue__description").text.split("\n")[2]
  #     roaster.url = doc.css("a.save-venue__link").attr("href").value
  #
  #     @@all << roaster
  #   end
  #   # binding.pry
  # end

end
