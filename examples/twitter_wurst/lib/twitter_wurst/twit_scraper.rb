class TwitterWurst::TwitScraper


    def scrape_twits
      tweets = []
      tweets << self.scrape_trump
      tweets << self.scrape_potus
      #Go to Twit's Twitter page
      #Pull most recent 100 tweets
      #<---Come up with some sort of criteria for determining the "worst" ones--->
      #list them in order
      tweets
    end

    def scrape_trump
      doc = Nokogiri::HTML(open("https://twitter.com/realdonaldtrump"))
      binding.pry
    end

    def scrape_potus
      doc = Nokogiri::HTML(open("https://twitter.com/potus"))
    end
end
