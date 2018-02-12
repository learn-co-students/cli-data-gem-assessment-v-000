require 'open-uri'
require 'nokogiri'
require 'pry'


class Scraper
  @@all = []
  # all_portals_url = "https://en.wikipedia.org/wiki/Portal:Contents/Portals#Technology_and_applied_sciences"
  def self.scrape_portals_page
    html = open("https://en.wikipedia.org/wiki/Portal:Contents/Portals#Technology_and_applied_sciences")
    doc = Nokogiri::HTML(html)
    
    
    #doc.css("h2 big").first.text
    #doc.css("h2 .mw-headline big a").first <<< checking if big has an image
    allmaintopics = doc.css("h2 .mw-headline big")
    allmaintopics.each{|i|
      topics = {}
      if allmaintopics.index(i) > 2
        copy = i.text.chomp("(see in all page types)").strip
        copy.slice!(-3..-1)
        topics[:main_topic] = copy
        #topics << copy
        @@all << topics
      end
    }
    
    #@@all[0][0].chomp!("(see in all page types)").strip!
    
    #start search for main titles here: doc.css("h2 .mw-headline big")[3].text
    #last main title topic: doc.css("h2 .mw-headline big").last.text
    #expect the main titles array to contain 11 items
    
    #first remove: @@all[0][0].chomp("(see in all page types)")
    #then remove all the unrelated charters: firstitem.slice!(-3..-1)
    
    # allportals = doc.css(".student-card")
    # allstudents.each{ |item| 
    #   student_hash = {}
    #   student_hash[:name] = item.css(".student-name").text
    #   student_hash[:location] = item.css(".student-location").text
    #   student_hash[:profile_url] = item.css("a").attribute("href").value
    #   @@all << student_hash
    # }
    
    # @@all
    
  end
  
  def self.scrape_portal_dyk
  end
  
end