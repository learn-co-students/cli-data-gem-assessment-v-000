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
    end
    #puts "#{scraped_index}"
    scraped_index
  end
  #date(this only returns the first one though)  =events.css(".date").text.split("- ")[0].strip
  #date (this returns the same with regular expression) = doc.css(".panel-picture-content .date").text.match(/[A-Z].+\s\d/)
  #date (this returns dates without location but with \n and its one long string) = doc.css(".panel-picture-content .date").text.strip.gsub(/\s+-.+$/,"")




  def scrape_details_page
    url_1 ="https://www.startupgrind.com/events/details/startup-grind-san-francisco-presents-ryan-popple-proterra#/"
    url_2 ="https://www.startupgrind.com/events/details/startup-grind-johannesburg-presents-come-party-with-joburgs-vibrant-entrepreneur-community#/"
    scraped_details = {}
    doc = Nokogiri::HTML(open(url_1))
    scraped_details[:long_descrip] = doc.css(".event-description").text.strip
    scraped_details[:time] = doc.at(".container-inner").children[8].text.strip
    scraped_details[:address] = doc.at(".container-inner//span[@itemprop = 'name']").children.text + ", " +
      doc.at(".container-inner//span[@itemprop = 'streetAddress']").children.text + ", " +
      doc.at(".container-inner//span[@itemprop = 'addressLocality']").children.text + ", " +
      doc.at(".container-inner//span[@itemprop = 'postalCode']").children.text
    scraped_details[:speakers] = doc.css(".carousel-inner").children.css("img").map {|y| y.attribute('alt').value}
    scraped_details
    end
    #long_descrip => doc.css(".event-description").text.strip
    #time =>  doc.at(".container-inner").children[8].text.strip
    #address_title => doc.at(".container-inner//span[@itemprop = 'name']").children.text
    #address_streetaddress => doc.at(".container-inner//span[@itemprop = 'streetAddress']").children.text
    #address_locality => doc.at(".container-inner//span[@itemprop = 'addressLocality']").children.text
    #address_postcode => doc.at(".container-inner//span[@itemprop = 'postalCode']").children.text
    #speakers => doc.css(".carousel-inner").children.css("img").map {|y| y.attribute('alt').value}



end

Scraper.new.scrape_details_page
