class ClevelandMuseumEvents::Scrapers

  def self.scrape_art
    @doc = Nokogiri::HTML(open("http://www.clevelandart.org/calendar"))
        #search nokogiri
    titles = self.scrape_values("div.field-name-field-card-title a") #=> []
    descriptions = self.scrape_values("div.field-card-mobile-description") #=> []
    urls = @doc.search("div.field-name-field-card-title a @href").first(12) #=> []
        #get title, description, url
    titles.each.with_index do |title, index|
      ClevelandMuseumEvents::Events.new(title, descriptions[index], urls[index])
    end
        #create event Event.new(title, description, url)
  end

  def self.scrape_values(css)
    @doc.search(css).map do |event|
      event_string = event.to_s.split('>')
      event_string[1].split('<')[0]
    end.flatten.first(12)
  end
end

#def self.scrape_urls
  # doc = Nokogiri::HTML(open("http://www.clevelandart.org/calendar"))
#  doc.search("div.field-name-field-card-title a @href").map do |url|
#    url
#  end
#end

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
