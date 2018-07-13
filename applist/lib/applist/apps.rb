class Applist::Apps
  attr_accessor :name, :category, :link, :desc, :avg_rating
  
  @@all = []
  
  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end
  
  def self.create(attributes)
    app = self.new(attributes)
    app.save 
    app
  end
  
  def save 
    @@all.push(self)
  end
  
  def self.all
    if @@all = []
      self.popular
    else
      binding.pry
      @@all
    end
  end
  
  def self.popular

    @@all << Applist::Scraper.scrape
    
  end
  
end
