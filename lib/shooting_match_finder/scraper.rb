require 'pry'
require 'open-uri'
require 'nokogiri'

class ShootingMatchFinder::Scraper

  BASE_PATH = "https://practiscore.com"

  def self.scrape_matches(website_url) #This to create an array of hashes that Match.rb can use to instanstiate Match objects.
    doc = Nokogiri::HTML(open(website_url))
    matches = doc.css(".list-group-item")
      matches[0...51].collect do |match_details|
        {:name => match_details.css(".searchMatchWebName").text.gsub("Open", "").gsub("Closed", "").strip,
        :match_url => match_details.css("a").attr('href').text}
    end
  end

  def self.scrape_from_match_url(match_url)
    doc = Nokogiri::HTML(open(match_url))
    #I want to be able to identify matches based on whether or not registration is open, since they need to scrape differently.
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

#//*[@id="psMainContainer"]/div[2]/div[3]/div[1]/p[3]

#doc.css("#searchResultsList").collect do |match|
# Match name: doc.css("#searchResultsList > li:nth-child(1) > a > div > h4 > span").text.strip is close, but not quite.

#xpath('//*[@id="searchResultsList"]/li[1]/a/@href')
#match_details.css("a").attr('href').text

# if match_details.css("a")
#   match_url = match_details.css("a").attr('href').text.strip
# else
#   match_url = nil
# end

#Okay, TODO for Scraper:
# => Configure scrape_matches to grab the href of each match.
# => Create a new method to scrape from the provided href of a match.
# => That new method will collect the rest of the data.
