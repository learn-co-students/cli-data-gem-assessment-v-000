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

  def self.scrape_ailments
    doc = Nokogiri::HTML(open(HERB_REM))
    doc.css('tr').css('strong')[2..-1].map {|ailment| ailment.text}
    binding.pry
  end

  def self.scrape_remedies
    remedies = []
    doc.css('tr').css('td')[2..-1].each_with_index do |cell, i|
      if i.odd?
        remedies << cell.text
      end
    end
    remedies = []
  end

end

Scraper.scrape_ailments
