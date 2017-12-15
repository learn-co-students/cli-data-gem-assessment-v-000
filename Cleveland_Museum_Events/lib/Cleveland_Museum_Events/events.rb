class ClevelandMuseumEvents::Events
  attr_accessor :title, :description, :url

@@event = []

#def initialize(title = nil, url = nil, description = nil)
#  @title = title
#  @url = url
#  @description = description
#end

def self.event
  title = @@event[0]
  description = @@event[1]
  url = @@event[2]
  puts ""
  puts "Title:
  '#{title}'"
  puts ""
  puts "Description:
  #{description}"
  puts ""
  puts "Website Link:
  #{url}"
end

def self.scrape_art
  doc = Nokogiri::HTML(open("http://www.clevelandart.org/calendar"))
  title = doc.search("div.field-name-field-card-title a").first.child.text
  description = doc.search("div.field-card-mobile-description").first.text
  #event.time =
  url = "www.clevelandart.org" + doc.xpath('//*[@id="calendar-today"]/div[3]/div/div[1]/div/div/div/div/div/div/div/div[1]/a/@href').first.value
  @@event << title
  @@event << description
  @@event << url
  #binding.pry
end

def self.scrape_naturalhx
  doc = Nokogiri::HTML(open("https://www.cmnh.org/visit/calendar"))
  title = doc.search("span.title-of-summary").text
  description =
  url =
  @@event << title
  @@event << description
  @@event << url
  binding.pry
end


def self.scrape_botanical
  doc = Nokogiri::HTML(open("https://www.cbgarden.org/calendar-of-events.aspx"))
  title = doc.search("td.days a href").text
  description =
  url =
  @@event << title
  @@event << description
  @@event << url
  binding.pry
end

def self.scrape_all
  self.scrape_art
  self.scrape_botanical
  self.scrape_naturalhx

end

end
