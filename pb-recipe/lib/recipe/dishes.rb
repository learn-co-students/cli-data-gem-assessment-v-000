class Recipe::Dish
  #Scrapes and returns initial information about the recipe of the day from 2 different sites

  attr_accessor :name, :url

  def self.scrape_dishes
    #returns an array of the recipe of the day from Food Network and the recipe of the day from My Daily Moment
    dishes = []
    dishes << self.scrape_d_1
    dishes << self.scrape_d_2
    dishes
  end

  def self.scrape_d_1
    #scrapes and returns initial information on dish 1 (Food Network)
    page = Nokogiri::HTML(open("http://www.foodnetwork.com/recipes/photos/recipe-of-the-day-what-to-cook-now.html"))
    info = self.new
    info.name = page.search("div.item figcaption h6").first.text.strip
    info.url = page.search("span.arrow a").first.attr("href").strip
    info
  end

  def self.scrape_d_2
    #scrapes and returns initial information on dish 2 (My Daily Moment)
    page = Nokogiri::HTML(open("http://www.mydailymoment.com/food_and_recipes/recipe_of_the_day/"))
    info = self.new
    info.name = page.search("div.nlDailyTitle a.nointelli").text.strip
    info.url = page.search("a.nointelli").first.attr("href").strip
    info
  end

end
