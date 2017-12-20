class ClevelandMuseumEvents::Scrapers

  def self.scrape_art
    @doc = Nokogiri::HTML(open("http://www.clevelandart.org/calendar"))
    titles = self.scrape_values("div.field-name-field-card-title a") #=> []
    descriptions = self.scrape_values("div.field-card-mobile-description") #=> []
    urls = @doc.search("div.field-name-field-card-title a @href").first(15) #=> []
    titles.each.with_index do |title, index|
      ClevelandMuseumEvents::Events.new(title, descriptions[index], urls[index])
    end
  end

  def self.scrape_values(css)
    @doc.search(css).map do |event|
      event_string = event.to_s.split('>')
      event_string[1].split('<')[0]
    end.flatten.first(15)
  end
end
