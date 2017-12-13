class Art_Museum::Scraper

    def open_page
      Nokogiri::HTML(open("http://www.clevelandart.org/calendar"))
    end

    def scrape_events_index
      self.open_page.css("#div.field-name-field-card-title a href").text
      binding.pry
    end

    def make_events
      scrape_events_index.each do |e|
        Art_Museum::Scrape.new_from_index_page(e)
      end
    end

  end

end



class Natural_History_Museum::Scraper

  def open_page
    Nokogiri::HTML(open("https://www.cmnh.org/visit/calendar"))
  end

  def scrape_events_index
    self.open_page.css("span.title-of-summary").text
    binding.pry
  end

  def make_events
    scrape_events_index.each do |e|
      Natural_History_Museum::Scrape.new_from_index_page(e)
    end
  end

end



class Botanical_Gardens::Scraper

    def open_page
      Nokogiri::HTML(open("https://www.cbgarden.org/calendar-of-events.aspx"))
    end

    def scrape_events_index
      self.open_page.css("td.days a href").text
      binding.pry
    end

    def make_events
      scrape_events_index.each do |e|
        Botanical_Gardens::Scrape.new_from_index_page(e)
      end
    end


end
