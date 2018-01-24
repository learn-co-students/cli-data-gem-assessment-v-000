class CoffeeRoasters::Scraper

  def scrape_roasters
    doc = Nokogiri::HTML(open("https://www.thrillist.com/drink/nation/the-21-best-coffee-roasters-in-the-country"))

    section = doc.css("section.save-venue")
    section.each do |data|

      name = data.css("h1 a.save-venue__link").text
      location = data.css("h2.save-venue__neighborhood").text
      bean = data.css("p.save-venue__description").text.split("\n")[0]
      details = data.css("p.save-venue__description").text.split("\n")[2]
      url = data.css("a.save-venue__link").attr("href").value

      CoffeeRoasters::Roaster.new(name, location, bean, details, url)
    end

  end

end
