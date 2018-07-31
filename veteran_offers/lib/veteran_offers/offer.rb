class VeteranOffers::Offer
  attr_accessor :details, :discount_type, :link

  def initialize(details = nil, discount_type = nil, link = nil)
    @details = details
    @discount_type = discount_type
    @link = link
  end

  def self.scrape_vawebsite
    doc = Nokogiri::HTML(open("https://members.veteransadvantage.com/deals/travel-lifestyle"))
    doc.css(".discount").collect do |discount|
    offer = self.new
    offer.details = discount.css(".description p").text.gsub("\n", "")
    offer.discount_type = discount.css(".discount-type").text.gsub("\n", "")
    offer.link = discount.attr("href")
    offer
    end
  end
end
