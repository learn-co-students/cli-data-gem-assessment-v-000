class DailyDeal::Deal
  attr_accessor :name, :price, :availability, :url

  def self.today
    self.scrape_deals
  end

  def self.scrape_deals
    deals = []

    deals << self.scrape_woot
    deals << self.scrape_meh
    deals
  end

  def self.scrape_woot
    doc = Nokogiri::HTML(open("https://www.woot.com"))

    deal = self.new
    deal.name = doc.search("h2.main-title").text.strip
    deal.price = doc.search("#todays-deal span.price.min").text.strip
    deal.availability = true
    deal.url = doc.search("a.wantone").first.attr("href")
    deal
    # binding.pry
  end

  def self.scrape_meh
    doc = Nokogiri::HTML(open("https://www.meh.com"))

    deal = self.new
    deal.name = doc.search("section.features h2").text.strip
    deal.price = doc.search("button.buy-button").text.gsub("Buy it", "").strip
    deal.availability = true
    deal.url = doc.search("section.features a.specs").attr("href")
    deal
    # binding.pry
  end

end
