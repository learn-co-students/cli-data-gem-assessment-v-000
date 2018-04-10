require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  @@all_topics = []

  def self.scrape_portals_page(name)
    choice_index = @@all_topics.index(name)
    #choice is the chosen topic index
    #there are 11 main topics derrived from Scraper.all_topics
    html = open("https://en.wikipedia.org/wiki/Portal:Contents/Portals")
    doc = Nokogiri::HTML(html) do |config|
      config.noblanks
    end


    #set portals-container class for all portal links for each topic
    #Thus there are 12 portal links containers but we're skipping the first one
    doc.search("div").each{|anchor|
      if anchor['style'] == "display: block;border: 0px solid #A3BFB1;border-bottom: 0px solid #A3BFB1;vertical-align: top;background: #F5FFFA;color: black;margin-bottom: 10px;padding: 1em;margin-top: 0em;padding-top: .3em;"
        anchor['class'] = "portals-container"
      end
    }

    #find and return all sub-portal links within a chosen topic
    @links = []
    doc.search(".portals-container a").each_with_index{|anchor, i|
      if i == choice_index && anchor.attribute("href").value.include?("/wiki/Portal:")
          @links << anchor.attribute("href").value.prepend("https://en.wikipedia.org")
      end
    }

    # randval = Randomn.new
    # portal_count = doc.search(".portals-container a").attribute("href").count{|i| i.value.include?("/wiki/Portal:")}
    #   randval.rand(portalcount)

    return @links.sample
    binding.pry

   end

   #Scrapes all main topics from all portals main page
   def self.all_topics
    html = open("https://en.wikipedia.org/wiki/Portal:Contents/Portals")
    doc = Nokogiri::HTML(html) do |config|
      config.noblanks
    end

    #sets a container for the main topic headlines
    doc.search("#mw-content-text div table table div").each{|anchor|
      if anchor['style'] == "position: relative;border: 0px solid #A3BFB1;background: #CEF2E0;color: black;padding: .1em;text-align: center;font-weight: bold;font-size: 100%;margin-bottom: 0px;border-top: 1px solid #A3BFB1;border-bottom: 1px solid #A3BFB1;"
        anchor['class'] = "title_container" unless anchor.text.include?("General reference")
      end
    }

    #set .headlines class for all main topics
    doc.search("h2 .mw-headline big").each{|anchor|
      anchor['class'] = "headlines" unless anchor.text == "Wikipedia's contents: Portals" || anchor.text == "Wikipedia's contents: Portals" || anchor.text.include?("General reference")
    }

    #updating the @@all_topics hash with topic symbols
    doc.search(".headlines").each{|anchor|
      copy = anchor.text.chomp("(see in all page types)").strip
      copy.slice!(-3..-1)
      @@all_topics << copy
    }
    return @@all_topics
   end

   def self.scrape_portal_dyk(rand_portal_url)
    html = open(rand_portal_url)
    doc = Nokogiri::HTML(html)

    if doc.at_css("[id^='Did_you_know']") != nil
      doc.at_css("[id^='Did_you_know']").parent.parent.next.next['class']="dyk_container" unless doc.at_css("[id^='Did_you_know']").parent.parent.next.next == nil
      return doc.search(".dyk_container ul li").sample.text
    end
   end

end
