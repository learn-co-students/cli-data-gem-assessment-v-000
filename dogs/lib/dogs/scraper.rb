class Dogs::Scraper
  attr_accessor :type, :popularity, :name

  def self.scrape_dogs

    doc = Nokogiri::HTML(open("http://www.dogbreedslist.info/family-dog-breeds/#.Wotwi6inFPa"))

    doc.search("div.main-r").each do |dog|
      type = dog.search(".right-t").text
      popularity = dog.search(".pop p").text
      binding.pry
    end

  end

end
