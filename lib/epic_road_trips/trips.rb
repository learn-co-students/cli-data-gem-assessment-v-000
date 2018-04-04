class EpicRoadTrips::Trips
  attr_accessor :road, :description

  @@all = []

  def initialize(road = nil, description = nil)
    @road = road
    @description = description
    @@all << self
  end

  def self.all
    @@all
  end

  def self.scrape_page
    doc = Nokogiri::HTML(open("https://www.roughguides.com/gallery/worlds-greatest-road-trips/"))

    doc.css(".row").each do |trip|
      trip = self.new
        trip.road = trip.css("h2").text
        trip.description = trip.css("p").text
        @@all << trip
    end
  end
end
