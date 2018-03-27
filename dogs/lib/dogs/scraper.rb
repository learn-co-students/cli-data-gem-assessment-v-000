class Dogs::Scraper

  def self.scrape_dogs

    doc = Nokogiri::HTML(open("http://www.dogbreedslist.info/family-dog-breeds/#.Wotwi6inFPa"))

    doc.css(".list").each do |dog|
      name = dog.css(".right-t p").text
      popularity = dog.css(".list-02 p").text
      temper = dog.css(".list-03 p").first.text
      Dogs::DogsPopularity.new(name, popularity, temper)
    end
  end
end
