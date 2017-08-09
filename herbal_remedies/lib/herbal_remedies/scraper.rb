require 'nokogiri'
require 'open-uri'
require 'pry'

#Herbal Remedies for Common Ailments - doc.css("h1").text
#Ailments: doc.css('tr').css('strong')[2..-1].text
# Name of herbs :doc.css('td').css('a').css('.herb')
# Link for herb :attr('href')

class Scraper

  HERB_REM = "http://www.motherearthnews.com/natural-health/herbal-remedies/herbal-remedies-common-ailments"
  @@doc_1 = Nokogiri::HTML(open(HERB_REM))
  @@doc_2 = Nokogiri::HTML(open("https://draxe.com/herbal-medicine/"))

  def self.scrape_ailments
    @@doc_1.css('tr').css('strong')[2..-1].map {|ailment| ailment.text}
  end

  def self.scrape_remedies
    remedies = []
    @@doc_1.css('tr').css('td')[2..-1].each_with_index do |cell, i|
      if i.odd?
        remedies << cell.text
      end
    end
    remedies
  end

  def self.ailment_remedy_hash
    Hash[scrape_ailments.zip(scrape_remedies.map { |r| r.split(",")  })]
  end

  def self.herbal_medicine
    @@doc_2.css('p')[4..7]
  end

  def self.benefits_of_h_m
    @@doc_2.css('p')[8..15]
  end

  def self.bonus
    doc = Nokogiri::HTML(open("https://www.meaningfullife.com/body-and-soul/"))
    doc.css("p")[7..8]
  end

  # Extended Functionality and New Feature #

  def self.herb_names_and_path_hash
    doc = Nokogiri::HTML(open("https://www.anniesremedy.com/chart.php"))
    hash = {}
    doc.css('td').css('a').css('.herb').each do |plant|
      hash[plant.text.strip.chomp(',')] = plant.attr('href')
    end
    hash
  end

  def self.herb_attributes_hash(path)
    doc = Nokogiri::HTML(open(path)) 
    attribute_hash = {}
    medicinal_uses = doc.css('.nobullets').css('li').css('.tag').text
    properties = doc.css('.nobullets').css('li').css('.chartID').text
    attribute_hash[:medicinal_uses] = medicinal_uses if medicinal_uses != ""
    attribute_hash[:properties] = properties if properties != ""
    attribute_hash[:preparation] = doc.css('.physW').text
    attribute_hash
  end

end

# Scraper.herb_attributes
