require 'pry'
require 'open-uri'
require 'nokogiri'

class ShootingMatchFinder::Scraper

  def self.scrape_matches #This to create an array of hashes that Match.rb can use to instanstiate Match objects.
    doc = Nokogiri::HTML(open("https://practiscore.com/search/matches"))
    doc.css("#searchResultsList").collect do |match|
      #this creates the array, the iteration will go over each match and store data as a hash.
    end
    binding.pry

  end

end


#match_details = [{:name => "2018 Berry's Steel Open",
#                 :date => "Sometime in April",
#                 :location => "SUPS Range, St. George, UT"},
#                 {:Match 2 info => something something},
#                 {:Match 3 info => something something}]
