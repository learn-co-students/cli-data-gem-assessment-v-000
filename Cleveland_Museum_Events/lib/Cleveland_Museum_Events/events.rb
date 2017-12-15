class ClevelandMuseumEvents::Events
  attr_accessor :title, :description, :url

@@events = []
@@description = []
@@url = []
#def initialize(title = nil, url = nil, description = nil)
#  @title = title
#  @url = url
#  @description = description
#end

def self.events
  title = @@events[0]
  title
end

def self.index
  @@events
end

def self.description
  description = @@description.flatten
  description
end

def self.url
  url = @@url.flatten
  url
end

def self.scrape_art
  doc = Nokogiri::HTML(open("http://www.clevelandart.org/calendar"))
  titles_withdescription = []
  doc.search("div.field-name-field-card-title a").each do |event|
    event_string = event.to_s.split('>')
    event_title = event_string[1].split('<')[0]
    block_titles_withdescription = []
    block_titles_withdescription << event_title
    titles_withdescription << block_titles_withdescription
  end
  titles = titles_withdescription.flatten
  title = titles.map.with_index {|item, index| "#{index +1}. #{item}"}
  @@events << title
  puts title[0..11]
end

def self.scrape_description
  doc = Nokogiri::HTML(open("http://www.clevelandart.org/calendar"))
  description_clean = []
  doc.search("div.field-card-mobile-description").each do |d|
    description_string = d.to_s.split('>')
    description = description_string[1].split('<')[0]
    description_clean_block = []
    description_clean_block << description
    description_clean << description_clean_block
  end
   descriptions = description_clean.flatten
   description = descriptions.map {|item| "#{item}"}
   @@description << description
  #binding.pry
end

def self.scrape_url
  doc = Nokogiri::HTML(open("http://www.clevelandart.org/calendar"))
  urls = []
  doc.search("div.field-name-field-card-title a @href").each do |u|
    weblinks = []
    weblinks << u.value
    urls << weblinks
  end
  url = urls.flatten
  @@url << url
end

end

#Saved to potentially also scrape the natural history museum and botanical gardens
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
