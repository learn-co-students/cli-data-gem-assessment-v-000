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
    
    
    # doc.search(".headlines").each{|anchor|
    #   anchor.parent = anchor.ancestors(".title_container").first
    # }
    
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
    # doc.search(".portal_container").each_with_index{|portal,indx|
    #   titles = doc.search(".title_container")
    #   #titles.each_with_index{|title,indx|
    #       #.wrap("<div class='parent_container'></div>")
    #     #while indx < titles.count 
    #     portal.parent = title[indx]
    #   #}
    #   anchor.parent = previous_element
    #   # doc.search(".headlines").each{|item|
    #   #   item.parent = anchor
    #   # }
    #   #anchor.children = 
    #   # anchor.css(".portals").each{|item|
    #   #   item.parent = anchor
    #   # }
    # }
    
    # doc.each{|anchor|
    #   anchor.remove unless anchor.css.include?(".headlines") || anchor.css.include?(".headlines") || anchor.css.include?(".title_container")
    # }
    
    binding.pry

    
          
    # doc.search(".portals").each{|anchor|
    #   anchor.parent = anchor.ancestors(".title_container").first
    # }
    
    binding.pry
    
    #anchor.ancestors("div").first["class"]="links_container"
      #anchor.ancestors("div").first.add_class("links_container")
      #anchor.add_class("portals")
    
    all_sections = doc.css(".")
    
    all_content.each{|i|
    #all_content.css(".portals").first
      titles = i.css(".headlines")
      
      portals = i.css(".portals")
      @@all << i.attribute("href").value.prepend("https://en.wikipedia.org")
    }
    
    #binding.pry
    
  #   #make all .portals elements children of their closest ancestor .headlines element
  #   #.ancestors(.headlines)
    
    
    
  #   #binding.pry
  #   # doc.all{|i| 
  #   #   if node.css(".portals") == nil || node.css(".headlines") nil
  #   #     node.delete
  #   #   end
  #   # }
  #   #doc.css("#mw-content-text div table table:nth-child(1) div").first
  #   all_content = doc.css("#mw-content-text div table table:nth-child(1) div")
  #   # headlines = item.css(".headlines")
  #   # all_content.each{|i|
  #   #   headlines.each{|item|
  #   #     counter = 0
  #   #     while counter < item.length
  #   #       item.add_child()
  #   #     end
  #   #   }
  #   # }
    
    
  #   #portals = doc.css(".portals")

    
  #   all_content.each{|item|
  #     headlines = item.css(".headlines")
  #     headlines.each_with_index{|title, i|
  #       if headlines.index(title) > 2
  #         copy = title.text.chomp("(see in all page types)").strip
  #         copy.slice!(-3..-1)
  #         @@all[copy.to_sym] = []
  #         doc.search(".portals").each{|link|
  #           @@all[copy.to_sym] << link.attribute("href").value.prepend("https://en.wikipedia.org")
  #         }
          
  #         binding.pry
  #         #all_content[lisindex].css(".portals")
  #         portals = doc.css(".portals")
  #         #@@all[copy.to_sym] << 
  #         portals.each{|link|
  #           if link.ancestors.include?(title) && item.next.include?(link)
  #             #@@all[copy.to_sym] << 
  #           end
  #         }
  #       end
  #     }
  #     binding.pry
  #     #@@all.each{|key,value|
        
  #     }
      
  #     binding.pry
  #     # content = i.next.children.css(".portals")
  #       #portals = doc.css(".portals")
    
  #   binding.pry
    
  #   #use .children to retrieve all children
  #   # doc.css("#mw-content-text div table table div").children.first.css("h2 .mw-headline big").next_element
    
    
  #   @all_content.each{|node|
  #     #FIRST FIND ALL MAIN TOPICS
  #     #find the first main topic title
  #     #main_topic_div.next_element: then find the first sub topic that occur before the next main topic title
  #     #then find the base portal links under that subtopic that occurs before the next sub topic
      
  #     allmaintopics = node.children.css("h2 .mw-headline big")
  #     allmaintopics.each{|i|
  #       @topics = {}
  #       if allmaintopics.index(i) > 2
  #         copy = i.text.chomp("(see in all page types)").strip
  #         copy.slice!(-3..-1)
  #         @topics[:main_topic] = copy
  #         sub_portals = i.parent.parent.parent.next.next
  #         @portals = {}
  #         @topics[:portals] = @portals
  #         sub_portals.each{|item|
  #           #sub_topics = .css("p b a")
  #           #.css("dl dd a")
  #           #doc.css("h2 .mw-headline big")[3].parent.parent.parent.next.next.css("p b a").text
  #           if item.attribute("href").value.include?("/wiki/Portal:")
  #             @portals[:portal_name] = item.text
  #             @sub_portals[:portal_url] = item.attribute("href").value.prepend("https://en.wikipedia.org")
  #           end
  #         }
  #         @@all << @topics
  #       end
  #     }
  #     # node.children.css("div p b a").first.text
  #     # each{|topic| 
      
        
  #     }
    
  #   # doc.css("div.mw-parser-output table tbody tr td table tbody tr td div").children
  #   # doc.css("#mw-content-text div table tbody tr td table tbody tr td div")
    
  #   #mw-content-text > div > table > tbody > tr > td > table:nth-child(1) > tbody > tr > td > div 
    
  #   #doc.css("h2 big").first.text
  #   #doc.css("h2 .mw-headline big a").first <<< checking if big has an image
  #   allmaintopics = doc.css("h2 .mw-headline big")
  #   allmaintopics.each{|i|
  #     topics = {}
  #     if allmaintopics.index(i) > 2
  #       copy = i.text.chomp("(see in all page types)").strip
  #       copy.slice!(-3..-1)
  #       topics[:main_topic] = copy
  #       #topics << copy
  #       @@all << topics
  #     end
  #   }
    
  #   #title="Portal:Library and information science"
  #   #doc.css("dl dd a").last
    
  #   #start with scrapping all subcategories
  #   #Scrape all links to portals: doc.css("dl dd a").attribute("title").value.include?("Portal:")
  #   all_portal_links = doc.css("dl dd a")
  #   # portal_titles = doc.css("dl dd a").text
  #   # portal_links = doc.css("dl dd a").attribute("href").value
  #   @@all_portals = []
    
  #   all_portal_links.each{|item| 
  #     @portals = {}
  #     @portals[:portal_url] = item.attribute("href").value.prepend("https://en.wikipedia.org")
  #     @@all_portals << @portals
  #   }
    
  #   @@all_sub_portals = []
  #   #THIS WORKS
  #   #doc.css("#mw-content-text div table table div").children.css("div p b a").first.text
    
    
  #   sub_portals = doc.css("div p b a") #table tbody tr td
  #   sub_portals.each{|item|
  #     @sub_portals = {}
  #     if item.attribute("href").value.include?("/wiki/Portal:")
  #       @sub_portals[:portal_url] = item.attribute("href").value.prepend("https://en.wikipedia.org")
  #       @@all_sub_portals << @sub_portals
  #     end
  #   }
    
  #   @@all_sub_portals.shift
    
  #   #<a href="/wiki/Portal:Culture" title="Portal:Culture">Culture</a>
  #   #include unless href="/wiki/Portal:Contents/Geography_and_places"
    
  #   binding.pry
    
  #   #@@all[0][0].chomp!("(see in all page types)").strip!
    
  #   #start search for main titles here: doc.css("h2 .mw-headline big")[3].text
  #   #last main title topic: doc.css("h2 .mw-headline big").last.text
  #   #expect the main titles array to contain 11 items
    
  #   #first remove: @@all[0][0].chomp("(see in all page types)")
  #   #then remove all the unrelated charters: firstitem.slice!(-3..-1)
    
  #   # allportals = doc.css(".student-card")
  #   # allstudents.each{ |item| 
  #   #   student_hash = {}
  #   #   student_hash[:name] = item.css(".student-name").text
  #   #   student_hash[:location] = item.css(".student-location").text
  #   #   student_hash[:profile_url] = item.css("a").attribute("href").value
  #   #   @@all << student_hash
  #   # }
    
  #   # @@all
    
  # end
  
  # def self.scrape_portal_dyk
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