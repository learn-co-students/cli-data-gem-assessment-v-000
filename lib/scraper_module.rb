require 'open-uri'
require 'nokogiri'
require 'pry'

module ScraperModule

  class Scraper
    @@all = {}
    @@all_facts = []
    
    # all_portals_url = "https://en.wikipedia.org/wiki/Portal:Contents/Portals#Technology_and_applied_sciences"
    def self.scrape_portals_page
      html = open("https://en.wikipedia.org/wiki/Portal:Contents/Portals#Technology_and_applied_sciences")
      doc = Nokogiri::HTML(html) do |config|
        config.noblanks
      end
      
      #Set div container class .title_container for all parent elements of each .headlines title
      doc.search("#mw-content-text div table table div").each{|anchor|
        if anchor['style'] == "position: relative;border: 0px solid #A3BFB1;background: #CEF2E0;color: black;padding: .1em;text-align: center;font-weight: bold;font-size: 100%;margin-bottom: 0px;border-top: 1px solid #A3BFB1;border-bottom: 1px solid #A3BFB1;"
          anchor['class'] = "title_container" unless anchor.text.include?("General reference")
        end
      }
  
      #set .headlines class for all section titles
      doc.search("h2 .mw-headline big").each{|anchor|
        anchor['class'] = "headlines" unless anchor.text == "Wikipedia's contents: Portals" || anchor.text == "Wikipedia's contents: Portals" || anchor.text.include?("General reference")
      }
      
      #removes line break element from doc object #Text('/n')
      #sets the parent class container .portal_container for each of the .portals
      doc.search(".title_container").each{|anchor|
        anchor.next.remove
        listcontent = anchor.next
        listcontent['class'] = "portal_container"
      }
      
      
      #finds all portals and sets .portals class for each
      doc.search("p b a").each{|anchor|
        if anchor.attribute("href").value.include?("/wiki/Portal:")
          anchor['class']="portals"
        end
      }
      doc.search("dl dd a").each{|anchor|
        anchor['class']="portals"
      }
      
      #populates the @@all hash
      doc.search(".title_container").each{|anchor|
        key = anchor.css(".headlines").first.text.chomp("(see in all page types)").strip
        key.slice!(-3..-1)
        links = []
        values = anchor.next.search(".portals")
        values.each{|item|
          links << item.attribute("href").value.prepend("https://en.wikipedia.org")
        }
        @@all[key.to_sym] = links
      }
      #binding.pry
      return @@all
      
     end
     
     def self.scrape_portal_dyk
       @@all.each{|key, value|
        all_facts = []
        @facts_by_category = {}
        value.each{|link|
          html = open(link)
          doc = Nokogiri::HTML(html)
          #binding.pry
          if doc.at_css("[id^='Did_you_know']") != nil #doc.at_css("#Did_you_know") != nil #need to fix non-uniform ids
            #this works: doc.at_css("[id^=Did_you_know]")
            #this also works: doc.at_css("[id|=Did_you_know]") 
            #sometimes "#Did_you_know..."" and sometimes "#Did_you_know?"
            #binding.pry
            doc.at_css("[id^='Did_you_know']").parent.parent.next.next['class']="dyk_container" unless doc.at_css("[id^='Did_you_know']").parent.parent.next.next == nil
            #.add_class("dyk_container")
            #binding.pry
            #the above code isn't setting the class for this element
            
            doc.search(".dyk_container ul li").each{|anchor|
              all_facts << anchor.text #slice!(0..7).slice!(-1)
              #binding.pry
            }
          #else
              # loc = @@all[key].find_index(value)
              # @@all[key].delete_at(loc)
              #@@all[key].find_index(link)
              #Figure out a way to remove the element from the @@all array
          end
        }
        binding.pry
        @@all_facts << @facts_by_category[key] = all_facts
        #binding.pry
        #@@all[key] = all_facts
        #doc.search(#Did_you_know... h2 div div).parent.parent.parent
       }
       binding.pry
       
       return @@all_facts
     end
     
     def self.all
       scrape_portals_page
     end
    
  end
end