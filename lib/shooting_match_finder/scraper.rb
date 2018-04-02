require 'open-uri'
require 'nokogiri'

class ShootingMatchFinder::Scraper

  def self.scrape_matches(website_url) #This creates an array of hashes that we then use to create match objects.
    doc = Nokogiri::HTML(open(website_url))
    matches = doc.css(".list-group-item")
      i = 0
      matches[i, 10].collect do |match_details|
        i += 10
        {:name => match_details.css(".searchMatchWebName").text.gsub("Open", "").gsub("Closed", "").strip,
        :match_url => match_details.css("a").attr('href').text}

    end
  end

  #scrape_matches could incorporate a counter, keeps track of where the last iteration ended, adds 10 to it, then scrapes as needed. Each iteration adds to the counter.

  def self.scrape_from_match_url(match_url) #Used to add attributes to newly created match objects.
    doc = Nokogiri::HTML(open(match_url))
    if !doc.xpath('//*[@id="psMainContainer"]/div[2]/div[3]/div[1]/p[1]').text.include?("Registration opens")
      match_info = {:match_start => doc.xpath('//*[@id="psMainContainer"]/div[2]/div[3]/div[1]/p[1]/strong').text.strip,
                    :location => doc.xpath('//*[@id="psMainContainer"]/div[2]/div[3]/div[1]/p[2]').text.gsub("Location:", "").strip,
                    :entry_fee => doc.xpath('//*[@id="psMainContainer"]/div[2]/div[3]/div[1]/dl/dd/text()').text.strip,
                    :description => doc.xpath('//*[@id="psMainContainer"]/div[2]/div[3]/div[1]/p[3]').text}
    else
      match_info = {:match_start => doc.xpath('//*[@id="psMainContainer"]/div[2]/div[3]/div[1]/p[2]/strong').text.strip,
                    :location => doc.xpath('//*[@id="psMainContainer"]/div[2]/div[3]/div[1]/p[3]').text.gsub("Location:", "").strip,
                    :entry_fee => doc.xpath('//*[@id="psMainContainer"]/div[2]/div[3]/div[1]/dl/dd/text()').text.strip,
                    :description => doc.xpath('//*[@id="psMainContainer"]/div[2]/div[3]/div[1]/p[4]').text}
    end
  end

end
