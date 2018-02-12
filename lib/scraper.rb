require 'open-uri'
require 'nokogiri'
require 'pry'


class Scraper
  @@all = []
  # all_portals_url = "https://en.wikipedia.org/wiki/Portal:Contents/Portals#Technology_and_applied_sciences"
  def self.scrape_portals_page
    html = open("https://en.wikipedia.org/wiki/Portal:Contents/Portals#Technology_and_applied_sciences")
    doc = Nokogiri::HTML(html)
    
    @all_content = doc.css("#mw-content-text div table table div") #use .children to retrieve all children
    # doc.css("#mw-content-text div table table div").children.first.css("h2 .mw-headline big").next_element
    
    
    @all_content.each{|node|
      #FIRST FIND ALL MAIN TOPICS
      #find the first main topic title
      #main_topic_div.next_element: then find the first sub topic that occur before the next main topic title
      #then find the base portal links under that subtopic that occurs before the next sub topic
      
      allmaintopics = node.children.css("h2 .mw-headline big")
      allmaintopics.each{|i|
        @topics = {}
        if allmaintopics.index(i) > 2
          copy = i.text.chomp("(see in all page types)").strip
          copy.slice!(-3..-1)
          @topics[:main_topic] = copy
          sub_portals = i.parent.parent.parent.next.next.css("p b a")
          sub_portals.each{|item|
            @portals = {}
            #doc.css("h2 .mw-headline big")[3].parent.parent.parent.next.next.css("p b a").text
            if item.attribute("href").value.include?("/wiki/Portal:")
              @portals[:portal_name] = item.text
              @sub_portals[:portal_url] = item.attribute("href").value.prepend("https://en.wikipedia.org")
            end
          }
          base_portals = doc.css("dl dd a")
          @portals = {}
              @portals[:portal_name] = item.text
              @portals[:portal_url] = item.attribute("href").value.prepend("https://en.wikipedia.org")
              @topics 
              @@all_sub_portals << @sub_portals
          
          @@all << @topics
        end
      }
      # node.children.css("div p b a").first.text
      # each{|topic| 
      
        
      }
    
    # doc.css("div.mw-parser-output table tbody tr td table tbody tr td div").children
    # doc.css("#mw-content-text div table tbody tr td table tbody tr td div")
    
    #mw-content-text > div > table > tbody > tr > td > table:nth-child(1) > tbody > tr > td > div 
    
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
    
    #title="Portal:Library and information science"
    #doc.css("dl dd a").last
    
    #start with scrapping all subcategories
    #Scrape all links to portals: doc.css("dl dd a").attribute("title").value.include?("Portal:")
    all_portal_links = doc.css("dl dd a")
    # portal_titles = doc.css("dl dd a").text
    # portal_links = doc.css("dl dd a").attribute("href").value
    @@all_portals = []
    
    all_portal_links.each{|item| 
      @portals = {}
      @portals[:portal_name] = item.text
      @portals[:portal_url] = item.attribute("href").value.prepend("https://en.wikipedia.org")
      @@all_portals << @portals
    }
    
    @@all_sub_portals = []
    #THIS WORKS
    #doc.css("#mw-content-text div table table div").children.css("div p b a").first.text
    
    
    sub_portals = doc.css("div p b a") #table tbody tr td
    sub_portals.each{|item|
      @sub_portals = {}
      if item.attribute("href").value.include?("/wiki/Portal:")
        @sub_portals[:portal_name] = item.text
        @sub_portals[:portal_url] = item.attribute("href").value.prepend("https://en.wikipedia.org")
        @@all_sub_portals << @sub_portals
      end
    }
    
    @@all_sub_portals.shift
    
    #<a href="/wiki/Portal:Culture" title="Portal:Culture">Culture</a>
    #include unless href="/wiki/Portal:Contents/Geography_and_places"
    
    binding.pry
    
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