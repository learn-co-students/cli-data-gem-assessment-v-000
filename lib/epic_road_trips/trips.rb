require 'pry'
require 'nokogiri'
require 'open-uri'

module EpicRoadTrips

class EpicRoadTrips::Trips
    attr_accessor :road, :description


  def self.get_page
      trips = []

       doc = Nokogiri::HTML(open("https://www.fodors.com/news/photos/the-20-best-road-trips-on-earth"))

       list_trips = doc.css(".container.slides")
       list_trips.each do |road_trip|
         trip = self.new
         trip.road = road_trip.css("h2").text.strip.gsub("\n", "").gsub("Book a Hotel", "")
         trip.description = road_trip.css("p").text.gsub("\u2019", " ").gsub("\u00A0", " ")

         trips << trip

         end
         trips
       end
     end
   end

 #EpicRoadTrips::Trips.get_page

 # The Wild Atlantic Way - is organized in a different way on the site so
 # it doesnt show up - Could I start iteration at trip #2? How would I do this


#If I change to list_trips = doc.css(".entry h2")
# list_trips.each do |road_trip|
  #trip = self.new
  #trip.road = road_trip.css("span")text
# => It outputs ALL the roadtrips in CLI 1-16 - BUT no descriptions

# doc.css("blockquote").text - returns all highlights, trying to iterate through this instead of "p"
# If I iterate through -  for trips and highlights I was getting a long string for each - how
# do I separate the strings into the objects?


#Using a while loops to iterate through

# doc.css(".entry h2").each do |road_trip|
#  trips = road_trip.text
# end


# doc.css (".entry blockquote").each do |road_trip|
#  highlights = road_trip.text
# end


#If I change to list_trips = doc.css(".entry h2")
# list_trips.each do |road_trip|
  #trip = self.new
  #trip.road = road_trip.css("span")text
# => It outputs ALL the roadtrips in CLI 1-16 - BUT no descriptions
