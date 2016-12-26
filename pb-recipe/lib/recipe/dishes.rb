class Recipe::Dish
  #Scrapes and returns initial information about the recipe of the day from 2 different sites

  attr_accessor :name, :url, :time, :servings, :ingredients, :instructions

  def self.scrape_dishes
    #returns an array of the recipe of the day from Food Network and the recipe of the day from My Daily Moment
    dishes = []
    dishes << self.scrape_d_1
    dishes << self.scrape_d_2
    dishes
  end

  def self.scrape_d_1
    #scrapes and returns information on dish 1 (Food Network)
    page = Nokogiri::HTML(open("http://www.foodnetwork.com/recipes/photos/recipe-of-the-day-what-to-cook-now.html"))
    info = self.new
    info.name = page.search("div.item figcaption h6").first.text.strip
    info.url = page.search("span.arrow a").first.attr("href").strip
    r_page = Nokogiri::HTML(open("http://www.foodnetwork.com/recipes/food-network-kitchens/herb-roasted-chicken-with-melted-tomatoes-recipe.html"))
    r_info = self.new
    r_info.time = r_page.search("dd.total").text.strip
    r_info.servings = r_page.search("div.difficulty dd").text.strip
    r_info.ingredients = r_page.search("div.col8 ingredients ul").text.strip
    r_info.instructions = r_page.search("div.col10 directions ul").text.strip
    info
    r_info
  end

  def self.scrape_d_2
    #scrapes and returns information on dish 2 (My Daily Moment)
    page = Nokogiri::HTML(open("http://www.mydailymoment.com/food_and_recipes/recipe_of_the_day/"))
    info = self.new
    info.name = page.search("div.nlDailyTitle a.nointelli").text.strip
    info.url = page.search("a.nointelli").first.attr("href").strip
    r_page = Nokogiri::HTML(open("http://www.mydailymoment.com/recipes/easy_brownies.php"))
    r_info = self.new
    r_info.time = r_page.search("div.rr_commenttext p").text.strip
    r_info.servings = r_page.search("div.rr_infodata").text.strip
    r_info.ingredients = r_page.search("div.rr_introtext div.ingredient li").text.strip
    r_info.instructions = r_page.search("div.instructions ol.rr_method_list li").text.strip
    info
    r_info
  end
 



end
