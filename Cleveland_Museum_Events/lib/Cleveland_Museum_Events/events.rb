class ClevelandMuseumEvents::Events
  attr_accessor :title, :date, :time, :url

def self.month
  self.scrape_events
end

def self.scrape_events
  events = []

  events << self.scrape_art
  events << self.scrape_botanical
  events << self.scrape_naturalhx

  binding.pry

  events
end

def self.scrape_art
  doc = Nokogiri::HTML(open("http://www.clevelandart.org/calendar"))

  event = self.new
  event.title = doc.search(div.field-name-field-card-title).attr("href")
  event.date =
  event.time =
  event.url =
  binding.pry
end

def self.scrape_naturalhx
  doc = Nokogiri::HTML(open("https://www.cmnh.org/visit/calendar"))

  event = self.new
  event.title = doc.search("span.title-of-summary").text
  event.date =
  event.time =
  event.url =
  binding.pry
end


def self.scrape_botanical
  doc = Nokogiri::HTML(open("https://www.cbgarden.org/calendar-of-events.aspx"))

  event = self.new
  event.title = doc.search("td.days a href").text
  event.date =
  event.time =
  event.url =
  binding.pry
end

def self.scrape_all
  self.scrape_art
  self.scrape_botanical
  self.scrape_naturalhx

end
end
