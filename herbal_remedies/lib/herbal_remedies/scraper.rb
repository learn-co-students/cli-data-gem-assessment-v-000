require 'nokogiri'
require 'open-uri'
require 'pry'

#Herbal Remedies for Common Ailments - doc.css("h1").text
#Ailments: doc.css('tr').css('strong')[2..-1].text
#Remedies: remedies = []
  # doc.css('tr').css('td')[2..-1].each_with_index do |cell, i|
  #   if i.odd?
  #     remedies << cell.text
  #   end
  # end

class Scraper

  HERB_REM = "http://www.motherearthnews.com/natural-health/herbal-remedies/herbal-remedies-common-ailments"
  @@doc = Nokogiri::HTML(open(HERB_REM))

  def self.scrape_ailments
    @@doc.css('tr').css('strong')[2..-1].map {|ailment| ailment.text}
  end

  def self.scrape_remedies
    remedies = []
    @@doc.css('tr').css('td')[2..-1].each_with_index do |cell, i|
      if i.odd?
        remedies << cell.text
      end
    end
    remedies
  end

  def self.ailment_remedy_hash
    Hash[scrape_ailments.zip(scrape_remedies.map { |r| r.split(",")  })]
  end

end

# Scraper.hash_ailments_remedy
