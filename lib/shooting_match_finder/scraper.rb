require 'open-uri'
require 'nokogiri'

class ShootingMatchFinder::Scraper

  BASE_PATH = "https://practiscore.com"

  def self.scrape_matches(website_url) #This creates an array of hashes that we then use to create match objects.
    doc = Nokogiri::HTML(open(website_url))
    matches = doc.css(".list-group-item")
      matches[0...51].collect do |match_details|
        {:name => match_details.css(".searchMatchWebName").text.gsub("Open", "").gsub("Closed", "").strip,
        :match_url => match_details.css("a").attr('href').text}
    end
  end

  def self.scrape_from_match_url(match_url) #Used to add attributes to newly created match objects.
    doc = Nokogiri::HTML(open(match_url))
    #This logic is used to identify matches based on whether or not registration is open, since they need to scrape differently.
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
