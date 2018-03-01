require 'pry'
require 'nokogiri'
require 'open-uri'


  ##Top Level Scraper##

  # def self.scrape_state_index_page("https://www.nps.gov/findapark/index.htm/")
   
    states = []
    
    index_url = "https://www.nps.gov/findapark/index.htm/"
    state_index_page = Nokogiri::HTML(open(index_url))
    
    state_list = state_index_page.css('area')
    state_list.each do |state|
      state_name = "#{state.attr("alt")}"
      state_link = "#{state.attr("href")}"
      
      states << {name: state_name, link: state_link}
    end
    
    puts states
  # end