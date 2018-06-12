class DailyFitness::Nutrition

  attr_accessor :title, :description, :url

  def self.info
    self.scrape_article #.Info is called from CLI.rb to produce the scraped article.
  end

  def self.scrape_article
    article = [] #Creates an empty array of the article

    article << self.bodybuilding #Adds the scraped data to the article array

    article #Calls on the array to produce the data.
  end

  def self.bodybuilding

    doc = Nokogiri::HTML(open("https://bodybuilding.com"))

    article = self.new
    article.title = doc.search("#DPG_Nutrition_Main .cms-article-list--article.hero .title").text.strip
    article.description = doc.search("#DPG_Nutrition_Main .cms-article-list--article.hero .description").text.strip
    article.url = doc.search("#DPG_Nutrition_Main .cms-article-list--article.hero a.thumb-container").map {|link| link['href'] }

    # binding.pry
    article
  end

end
