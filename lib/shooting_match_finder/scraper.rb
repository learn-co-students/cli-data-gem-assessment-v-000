require 'pry'
require 'open-uri'
require 'nokogiri'

class ShootingMatchFinder::Scraper

  def self.scrape_matches #This to create an array of hashes that Match.rb can use to instanstiate Match objects.
    doc = Nokogiri::HTML(open("https://practiscore.com/search/matches"))
    matches = doc.css("#searchResultsList").collect do |match|
      match.css(".list-group-item").each do |match_details|
          {:name => match_details.css(".searchMatchWebName").text.strip,
          :date => "",
          :location => "",
          :entry_fee => "",
          :description => ""}
       #binding.pry
     end
    end
    matches
  end

end

# Match name: doc.css("#searchResultsList > li:nth-child(1) > a > div > h4 > span").text.strip is close, but not quite.
