require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  @@all_topics = []
  
  def self.scrape_portals_page(topic_selection)
    @topic_links = []
    html = open("https://en.wikipedia.org/wiki/Portal:Contents/Portals#Technology_and_applied_sciences")
    doc = Nokogiri::HTML(html) do |config|
      config.noblanks
    end
    
    #Set div container class .title_container for all parent elements of each .headlines title
    
    doc.search("#mw-content-text div table table div").each{|anchor|
      if anchor['style'] == "position: relative;border: 0px solid #A3BFB1;background: #CEF2E0;color: black;padding: .1em;text-align: center;font-weight: bold;font-size: 100%;margin-bottom: 0px;border-top: 1px solid #A3BFB1;border-bottom: 1px solid #A3BFB1;"
        anchor['class'] = "title_container" unless anchor.text.include?("General reference")
      end
      #if anchor.children.css.include?("#selected_topic")
    }

    #set .headlines class for the topic_selection
    doc.search("h2 .mw-headline big").each{|anchor|
      anchor['class'] = "headlines" unless anchor.text == "Wikipedia's contents: Portals" || anchor.text == "Wikipedia's contents: Portals" || anchor.text.include?("General reference")
      if anchor.text == topic_selection
        anchor['id'] = "selected_topic"
      end
    }
    
    #removes line break element from doc object #Text('/n')
    #sets the parent class container .portal_container for each of the .portals
    doc.search(".title_container").each{|anchor|
      anchor.next.remove
      listcontent = anchor.next
      if anchor.at_css("#selected_topic") != nil
        listcontent['class'] = "portal_container"
      end
    }
    
    #finds all portal links under the selected_topic and adds them to the @topic_links array
    doc.search("#portal_container p b a").each{|anchor|
      if anchor.attribute("href").value.include?("/wiki/Portal:")
        @topic_links << anchor.attribute("href").value.prepend("https://en.wikipedia.org")
        #anchor['class']="portals"
      end
    }
    doc.search("#portal_container dl dd a").each{|anchor|
      #anchor['class']="portals"
      @topic_links << anchor.attribute("href").value.prepend("https://en.wikipedia.org")
    }
    return @topic_links
   end
######################
   def self.scrape_main_topics
    html = open("https://en.wikipedia.org/wiki/Portal:Contents/Portals#Technology_and_applied_sciences")
    doc = Nokogiri::HTML(html) do |config|
      config.noblanks
    end
    
    doc.search("#mw-content-text div table table div").each{|anchor|
      if anchor['style'] == "position: relative;border: 0px solid #A3BFB1;background: #CEF2E0;color: black;padding: .1em;text-align: center;font-weight: bold;font-size: 100%;margin-bottom: 0px;border-top: 1px solid #A3BFB1;border-bottom: 1px solid #A3BFB1;"
        anchor['class'] = "title_container" unless anchor.text.include?("General reference")
      end
      #if anchor.children.css.include?("#selected_topic")
    }

    #set .headlines class for the topic_selection
    doc.search("h2 .mw-headline big").each{|anchor|
      anchor['class'] = "headlines" unless anchor.text == "Wikipedia's contents: Portals" || anchor.text == "Wikipedia's contents: Portals" || anchor.text.include?("General reference")
    }
    
    #updating the @@all_topics hash with topic symbols
    doc.search(".headlines").each{|anchor|
      copy = anchor.text.chomp("(see in all page types)").strip
      copy.slice!(-3..-1)
      @@all_topics << copy
    }
    #binding.pry
    return @@all_topics
   end
#####################
   def self.scrape_portal_dyk(rand_portal_url)
    html = open(rand_portal_url)
    doc = Nokogiri::HTML(html)
    
    if doc.at_css("[id^='Did_you_know']") != nil
      doc.at_css("[id^='Did_you_know']").parent.parent.next.next['class']="dyk_container" unless doc.at_css("[id^='Did_you_know']").parent.parent.next.next == nil
      return doc.search(".dyk_container ul li").sample.text
    end
   end
   
  # def self.all_topics
  #   @@all_topics
  # end
  
end
