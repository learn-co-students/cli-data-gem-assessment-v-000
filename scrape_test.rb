require 'nokogiri'
require 'pry'
require 'open-uri'

class Scraper

  def scrape_index
    doc = Nokogiri::HTML(open("https://www.startupgrind.com/events/"))
    binding.pry
    #collection of events = doc.css(".panel-picture-content")
    #title/name = doc.css(".panel-picture-content h4").text
    #event_type = doc.css(".panel-picture-content h5").text
    #short_descrip = doc.css("p.description").text
    #location = doc.css("a.chapter-link").text
    #location_link = doc.css(".date a").attribute("href").value
    #card.css("a").attribute("href").value}
    #details_link = doc.css(".panel-picture-content a")[1].attribute("href").value

    #date(this only returns the first one though)  =doc.css(".panel-picture-content .date").text.split("- ")[0].strip
    #date (this returns the same with regular expression) = doc.css(".panel-picture-content .date").text.match(/[A-Z].+\s\d/)
    #date (this returns dates without location but with \n and its one long string) = doc.css(".panel-picture-content .date").text.strip.gsub(/\s+-.+$/,"")

  end

end

Scraper.new.scrape_index

=begin
 def self.scrape_index_page(index_url)
    html = File.read(index_url)
    studentsite =  Nokogiri::HTML(html)
    scraped_students = []
    studentsite.css(".student-card").each do | card |
      scraped_students << {:name => card.css(".student-name").text,
      :location => card.css(".student-location").text,
       :profile_url => card.css("a").attribute("href").value}
      end
    scraped_students
    end
=end
