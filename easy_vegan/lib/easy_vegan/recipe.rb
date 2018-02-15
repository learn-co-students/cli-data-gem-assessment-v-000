class EasyVegan::Recipe
attr_accessor :category, :total_time, :cuisine_category, :serving_size, :url, :title

@@all = []

  def initialize
    @@all = []
  end


  def self.titles(category_number)
    @titles = []
    @titles << EasyVegan::Scraper.titles(category_number)
  end

  def self.all
    @@all
  end




#we need to create Recipe objects and shovel in their title and url.
#we need to go to each ojbect, using their url attribute and then scrape remaining attribute


end
