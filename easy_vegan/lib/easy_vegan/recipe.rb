class EasyVegan::Recipe
attr_accessor :category, :total_time, :cuisine_category, :serving_size, :url, :title

@@all = []

  def initialize(first_recipe_hash)
    first_recipe_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_collection(return_value_of_scrape_index)
    return_value_of_scrape_index.each do |hashie|
      Student.new(hashie)
    end
  end

  def add_recipe_attributes(return_value_of_scraped_recipe_page)
    return_value_of_scraped_recipe_page.each {|key, value| self.send(("#{key}="), value)}
  end


  def self.all
    @@all
  end




#we need to create Recipe objects and shovel in their title and url.
#we need to go to each ojbect, using their url attribute and then scrape remaining attribute


end
