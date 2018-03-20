require 'pry'
require 'open-uri'
require 'nokogiri'

class ShootingMatchFinder::Scraper

  def self.scrape_matches #This to create an array of hashes that Match.rb can use to instanstiate Match objects.
    doc = Nokogiri::HTML(open("https://practiscore.com/search/matches"))
    doc.css("#searchResultsList").collect do |match|
      {:name => "",
       :date => "",
       :location => "",
       :entry_fee => "",
       :description => ""}
    end
    binding.pry

  end

end


#match_details = [{:name => "2018 Berry's Steel Open",
#                 :date => "Sometime in April",
#                 :location => "SUPS Range, St. George, UT"},
#                 {:Match 2 info => something something},
#                 {:Match 3 info => something something}]
