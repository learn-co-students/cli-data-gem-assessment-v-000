require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper

  def self.get_page

    doc = Nokogiri::HTML(open("https://www.fodors.com/news/photos/the-20-best-road-trips-on-earth"))

    binding.pry


    doc.css(" tbd? ").each do |trip|
      trip = Trip.new
      trip.road = doc.css("h2").text.strip
      trip.country = doc.css("h3.where").text #doc.css("h3.where")[0].children[3].children.text - this is specifically Aus, need it to be all countries
      trip.description = doc.css("p").text #This scrape has beginning of website info too 
    end
  end
end

Scraper.get_page
