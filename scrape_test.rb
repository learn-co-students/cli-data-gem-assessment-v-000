require 'nokogiri'
require 'pry'
require 'open-uri'

class Scraper


  def scrape_index_page
    doc = Nokogiri::HTML(open("https://www.startupgrind.com/events/"))
    scraped_index = []
    doc.css("#upcoming-events .panel-picture-content").each do |events|
    scraped_index << {:name => events.css("h4").text,
    :event_type => events.css("h5").text,
    :short_descrip => events.css("p.description").text,
    :location => events.css("a.chapter-link").text,
    :location_link => events.css(".date a").attribute("href").value,
    :details_link => events.css("a")[1].attribute("href").value,
    :date => events.css(".date").text.split("- ")[0].strip
  }
    #date(this only returns the first one though)  =events.css(".date").text.split("- ")[0].strip
    #date (this returns the same with regular expression) = doc.css(".panel-picture-content .date").text.match(/[A-Z].+\s\d/)
    #date (this returns dates without location but with \n and its one long string) = doc.css(".panel-picture-content .date").text.strip.gsub(/\s+-.+$/,"")
    end
    #puts "#{scraped_index}"
    scraped_index
  end

  def scrape_details_page
    url_1 ="https://www.startupgrind.com/events/details/startup-grind-san-francisco-presents-ryan-popple-proterra#/"
    url_2 ="https://www.startupgrind.com/events/details/startup-grind-johannesburg-presents-come-party-with-joburgs-vibrant-entrepreneur-community#/"
    scraped_details = {}
    doc = Nokogiri::HTML(open(url_1))
    binding.pry

    #long_description => doc.css(".event-description").text.strip
    #time =>  doc.css(".container-inner")[0].text.split("2018")[1].to_s.strip!.delete!("\r\n\\")
    #address_title => doc.at(".container-inner//span[@itemprop = 'name']").children.text
    #address_streetaddress => doc.at(".container-inner//span[@itemprop = 'streetAddress']").children.text
    #address_locality => doc.at(".container-inner//span[@itemprop = 'addressLocality']").children.text
    #address_postcode => doc.at(".container-inner//span[@itemprop = 'postalCode']").children.text
    #speakers
  end




end

Scraper.new.scrape_details_page
