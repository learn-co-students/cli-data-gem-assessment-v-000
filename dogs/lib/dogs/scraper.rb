class Dogs::Scraper
  attr_accessor :popularity, :name

  def self.scrape_dogs

    doc = Nokogiri::HTML(open("http://www.dogbreedslist.info/family-dog-breeds/#.Wotwi6inFPa"))

    doc.css(".list p").each do |dog|
      name = dog.css(".right-t p").text
      popularity = dog.css(".pop p").text
      Dogs::DogsPopularity.new(name, popularity)
      binding.pry
    end

  end

end
