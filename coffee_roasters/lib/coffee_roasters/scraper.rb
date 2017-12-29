class CoffeeRoasters::Scraper

  def scrape_roasters
    doc = Nokogiri::HTML(open("https://www.thrillist.com/drink/nation/the-21-best-coffee-roasters-in-the-country"))

    section = doc.css(".save-venue")
    section.each do |data|
      roaster = CoffeeRoasters::Roaster.new
      roaster.name = data.css("h1 a.save-venue__link").text
      roaster.location = data.css("h2.save-venue__neighborhood").text
      roaster.bean = data.css("p.save-venue__description").text.split("\n")[0]
      roaster.details = data.css("p.save-venue__description").text.split("\n")[2]
      roaster.url = data.css("h1 a.save-venue__link").attr("href").value

      roaster.save
    end

  end

end
