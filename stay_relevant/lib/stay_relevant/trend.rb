class StayRelevant::Trend
  attr_accessor :name

  def self.today 
  self.scrape_trends
  end 


  def self.scrape_trends 
  trends = []

  trends << self.scrape_twitter
  trends << self.scrape_bbc
  trends << self.scrape_mashable
  trends << self.scrape_huffington_post
  trends << self.scrape_gawker

  trends
  end 

  def self.scrape_twitter 
  doc = Nokogiri::HTML(open("http://trends24.in/"))
  
  trend = self.new
  trend.name = "Twitter: " + doc.search("ol").css("li").first.text

  trend
end 
  

  def self.scrape_bbc
  doc = Nokogiri::HTML(open("http://www.bbc.com/news/blogs/trending"))
  
  trend = self.new
  trend.name = "BBC: " + doc.search("h2.unit__title").first.text + ": " + doc.search("div.story-body__inner").first.text.strip

  trend
end

  def self.scrape_mashable
    doc = Nokogiri::HTML(open("http://mashable.com/category/trending-topics/"))
    
    trend = self.new
    trend.name = "Mashable: " + doc.search("h1.article-title").first.text.strip 
    
    trend
  end

  def self.scrape_huffington_post
    doc = Nokogiri::HTML(open("http://www.huffingtonpost.com/news/trending-topics/"))

    trend = self.new
    trend.name = "Huffington Post: " + doc.search("h2.seo_top3").first.text.strip

    trend
  end

  def self.scrape_gawker
    doc = Nokogiri::HTML(open("http://gawker.com/tag/trending"))
    
    trend = self.new
    trend.name = "Gakwer: " + doc.search("a.js_entry-link").first.text

    trend

  end



end


