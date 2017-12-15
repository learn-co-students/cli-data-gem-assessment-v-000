class ClevelandMuseumEvents::Events
  attr_accessor :title, :description, :url

@@event = []
@@description = []
#def initialize(title = nil, url = nil, description = nil)
#  @title = title
#  @url = url
#  @description = description
#end

def self.event
  title = @@event[0]
end

def self.description
  description = @@description[0]
end

def self.scrape_art_title
  doc = Nokogiri::HTML(open("http://www.clevelandart.org/calendar"))
  titles_withdescription = []
  titles_only = []
  doc.search("div.field-name-field-card-title a").each do |event|
    event_string = event.to_s.split('>')
    event_title = event_string[1].split('<')[0]
    block_titles_withdescription = []
    block_titles_withdescription << event_title
    titles_withdescription << block_titles_withdescription
    #binding.pry
  end
  titles = titles_withdescription.flatten
  title = titles.map.with_index {|item, index| "#{index +1}. #{item}"}
  event_titles = puts title[0..11]

  @@event << event_titles
  @@event << description
  @@event << url
  #binding.pry
end

def self.scrape_description_and_url

# self.scrape_naturalhx  
#  doc = Nokogiri::HTML(open("https://www.cmnh.org/visit/calendar"))
#  title = doc.search("span.title-of-summary").text
#  description =
#  url =
#  @@event << title
#  @@event << description
#  @@event << url
#  binding.pry
#end#
#

#def self.scrape_botanical
#  doc = Nokogiri::HTML(open("https://www.cbgarden.org/calendar-of-events.aspx"))
#  title = doc.search("td.days a href").text
#  description =
#  url =
#  @@event << title
#  @@event << description
#  @@event << url
#  binding.pry
#end#

#def self.scrape_all
#  self.scrape_art
#  self.scrape_botanical
#  self.scrape_naturalhx#

#end#

#end
