require 'open-uri'
require 'nokogiri'
require 'pry'


class Scraper
  @@all = {}
  # all_portals_url = "https://en.wikipedia.org/wiki/Portal:Contents/Portals#Technology_and_applied_sciences"
  def self.scrape_portals_page
    html = open("https://en.wikipedia.org/wiki/Portal:Contents/Portals#Technology_and_applied_sciences")
    doc = Nokogiri::HTML(html) do |config|
      config.noblanks
    end
    
    #SETTING ALL CLASSES FOR ELEMENTS
    doc.search("#mw-content-text div table table div").each{|anchor|
      if anchor['style'] == "position: relative;border: 0px solid #A3BFB1;background: #CEF2E0;color: black;padding: .1em;text-align: center;font-weight: bold;font-size: 100%;margin-bottom: 0px;border-top: 1px solid #A3BFB1;border-bottom: 1px solid #A3BFB1;"
        
        anchor['class'] = "title_container" unless anchor.text.include?("General reference")
      end
    }

    
    doc.search("h2 .mw-headline big").each{|anchor|
      anchor['class'] = "headlines" unless anchor.text == "Wikipedia's contents: Portals" || anchor.text == "Wikipedia's contents: Portals" || anchor.text.include?("General reference")
    }
    
    doc.search(".title_container").each{|anchor|
      anchor.next.remove
      listcontent = anchor.next
      listcontent['class'] = "portal_container"
    }
    
    doc.search("p b a").each{|anchor|
      if anchor.attribute("href").value.include?("/wiki/Portal:")
        anchor['class']="portals"
      end
    }
    
    doc.search("dl dd a").each{|anchor|
      anchor['class']="portals"
    }
    
    doc.search(".title_container").each{|anchor|
      key = anchor.css(".headlines").first.text.chomp("(see in all page types)").strip
      key.slice!(-3..-1)
      links = []
      values = anchor.next.search(".portals")
      values.each{|item|
        links << item.attribute("href").value.prepend("https://en.wikipedia.org")
      }
      #binding.pry
      @@all[key.to_sym] = links
    }
    
    binding.pry

    
   end
   
   def self.scrape_portal_dyk
     @@all.each{|i|
      html = open(i)
      doc = Nokogiri::HTML(html)
      binding.pry
      #doc.search(#Did_you_know... h2 div div).parent.parent.parent
     }
   end
  
end