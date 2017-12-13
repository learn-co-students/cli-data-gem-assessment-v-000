class Art_Museum::Scraper

    def get_page
      Nokogiri::HTML(open("http://www.clevelandart.org/calendar"))
    end

    def scrape_events_index
      self.get_page.css("div.field-name-field-card-title a href").text
    end

    def make_events
      scrape_events_index.each do |e|
        Art_Museum::Scrape.new_from_index_page(e)
      end
    end

  end

end



class Natural_History_Museum::Scraper

  def Scraper

  end

end



class Botanical_Gardens::Scraper

  # Month - h2 "big-calendar-month"
  # Day - class "days font-garamond" text(Day of the Month) a (href)


  def Scraper

  end

end
