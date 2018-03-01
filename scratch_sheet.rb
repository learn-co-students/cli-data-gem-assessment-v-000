require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper

  ##Top Level Scraper##

  def self.scrape_state_index_page("https://www.nps.gov/findapark/index.htm/")
    state_index_page = Nokogiri::HTML(open("https://www.nps.gov/findapark/index.htm/"))
    states = []

    state_index_page.css.("#Map area").each do |state|
      state_name = "#{state.attr("alt")}"
      state_link = "#{state.attr("href")}"
      
      states << {name: state_name, link: state_link}
    end
    binding.pry
  end
  
  # def self.scrape_state_page(state_url)
  #   state_page = Nokogiri::HTML(open(state_url))
  #   parks = []
    
  #   state_page.css("div.col-md-9.col-sm-9.col-xs-12.table-cell.list_left").each do |park|
  #     park_type = park.css("h2").text
  #     park_name = park.css("h3").text
  #     park_location = park.css("h4").text
  #     park_description = park.css("p").text
      
  #     parks << {name: park_name, type: park_type, location: park_location, description: park_description}
  #   end
    
  #end
  
end