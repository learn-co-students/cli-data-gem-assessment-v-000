# require 'pry'
class TopWebApps::WebApps

  attr_accessor :name, :about, :image, :more_information

  def self.web_apps
    puts "List of the top techs of 2017".upcase
    puts ""
    self.web_scraper
  end


  def self.scrape_web_apps
  web_sites = []

  web_sites << self.web_scraper

  #srapre top 10 web app web page
  # return attributes
  # initiate web apps intances

  web_sites
end

def self.web_scraper
  doc = Nokogiri::HTML(open("http://time.com/4626654/ces-2017-best-gadgets/"))

   doc.css('._9MDA9q9L').collect do |info|
    tech = self.new
    tech.name = info.css('h2').text
    tech.about = info.css('p').text
    tech.image = info.css('img').attr('data-src').value
    tech.more_information = "http://time.com"+info.css('a').attr('href').value
    # binding.pry

    tech
  end
end


end
