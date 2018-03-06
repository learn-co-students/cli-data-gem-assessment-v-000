require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  @@all_topics = []

  def self.scrape_portals_page(choice)
    @topic_links = {}
    html = open("https://en.wikipedia.org/wiki/Portal:Contents/Portals")
    doc = Nokogiri::HTML(html) do |config|
      config.noblanks
    end
    #binding.pry
    doc.search("div").each{|anchor|
      if anchor['style'] == "display: block;border: 0px solid #A3BFB1;border-bottom: 0px solid #A3BFB1;vertical-align: top;background: #F5FFFA;color: black;margin-bottom: 10px;padding: 1em;margin-top: 0em;padding-top: .3em;"
        anchor['class'] = "portals-container"
      end
    }

    #"display: block;border: 0px solid #A3BFB1; #if use this I need to remove the first 2 undesired elements

    # ####################determining headline containers###################
    # doc.search("#mw-content-text div table table div").each{|anchor|
    #   if anchor['style'] == "position: relative;border: 0px solid #A3BFB1;background: #CEF2E0;color: black;padding: .1em;text-align: center;font-weight: bold;font-size: 100%;margin-bottom: 0px;border-top: 1px solid #A3BFB1;border-bottom: 1px solid #A3BFB1;"
    #     anchor['class'] = "title_container" unless anchor.text.include?("General reference")
    #   end
    #   #if anchor.children.css.include?("#selected_topic")
    # }
    #
    # #set .headlines class for the topic_selection
    # doc.search("h2 .mw-headline big").each{|anchor|
    #   anchor['class'] = "headlines" unless anchor.text == "Wikipedia's contents: Portals" || anchor.text == "Wikipedia's contents: Portals" || anchor.text.include?("General reference")
    # }
    #
    # #updating the @@all_topics hash with topic symbols
    # doc.search(".headlines").each{|anchor|
    #   copy = anchor.text.chomp("(see in all page types)").strip
    #   copy.slice!(-3..-1)
    #   @@all_topics << copy
    # }
    # binding.pry
    #
    # ####################################

    #Set div container class .title_container for all parent elements of each .headlines title
    # doc.search("#mw-content-text div table").each{|anchor|
    #   #if anchor['style'] == "position: relative;border: 0px solid #A3BFB1;background: #CEF2E0;color: black;padding: .1em;text-align: center;font-weight: bold;font-size: 100%;margin-bottom: 0px;border-top: 1px solid #A3BFB1;border-bottom: 1px solid #A3BFB1;"
    #     anchor['class'] = "title-container" unless anchor.text.include?("General reference")
    #   #end
    # }

    #set .headlines class for the topic_selection
    # doc.search("h2 .mw-headline big").each{|anchor|
    #   anchor['class'] = "headlines" unless anchor.text == "Wikipedia's contents: Portals" || anchor.text == "Wikipedia's contents: Portals" || anchor.text.include?("General reference")
    #   if anchor.text == topic_selection
    #     anchor['id'] = "selected-topic"
    #   end
    # }
    #removes line break element from doc object #Text('/n')
    #sets the parent class container .portal_container for each of the .portals
    # doc.search(".title-container").each{|anchor|
    #   #anchor.next.remove
    #   listcontent = anchor.next
    #   if anchor.at_css("#selected-topic") != nil
    #     listcontent['class'] = "portal-container"
    #   end
    # }

    #finds all portal links under the selected_topic and adds them to the @topic_links array
    # doc.search(".portals-container p b a").each{|anchor|
    #   #binding.pry
    #   if anchor.attribute("href").value.include?("/wiki/Portal:")
    #     @topic_links << anchor.attribute("href").value.prepend("https://en.wikipedia.org")
    #     #anchor['class']="portals"
    #   end
    # }
    # doc.search(".portals-container dl dd a").each{|anchor|
    #   #anchor['class']="portals"
    #   @topic_links << anchor.attribute("href").value.prepend("https://en.wikipedia.org")
    # }

    doc.search(".portals-container a").each_with_index{|anchor, i|
      links = []
      if i == choice && anchor.attribute("href").value.include?("/wiki/Portal:")
          links << anchor.attribute("href").value.prepend("https://en.wikipedia.org")
          # @topic_links[choice] =
          # @topic_links << anchor.attribute("href").value.prepend("https://en.wikipedia.org")
      end
      @topic_links = links
    }
    # binding.pry
    # # doc.search(".portals-container a")[choice.to_i].attribute("href").value.prepend("https://en.wikipedia.org")
    #
    # # doc.search(".portals-container a")[choice.to_i].attribute("href").value.prepend("https://en.wikipedia.org")
    #
    # binding.pry
    return @topic_links
   end
######################
   def self.all_topics
    html = open("https://en.wikipedia.org/wiki/Portal:Contents/Portals")
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
  #   self.scrape_main_topics
  # end

end
