class Recipe::Scraper

  #DISHES

  def self.scrape_dishes
    self.scrape_d_1
    self.scrape_d_2
  end

  def self.get_page_d_1
    Nokogiri::HTML(open("http://www.foodnetwork.com/recipes/photos/recipe-of-the-day-what-to-cook-now.html"))
  end

  def self.scrape_d_1
    #scrapes and returns initial information on dish 1 (Food Network)
    page = self.get_page_d_1
    @info = Recipe::DishesInfo.new
    @info.name = page.css("p.o-PhotoGalleryPromo__a-Cta").first.text.gsub("Get the Recipe:","").strip
    @info.url = page.css("p.o-PhotoGalleryPromo__a-Cta a").attr("href").value
  end

  def self.get_page_d_2
    Nokogiri::HTML(open("http://www.mydailymoment.com/food_and_recipes/recipe_of_the_day/"))
  end

  def self.scrape_d_2
    #scrapes and returns initial information on dish 2 (My Daily Moment)
    page = self.get_page_d_2
    @info = Recipe::DishesInfo.new
    @info.name = page.css("div.nlDailyTitle a.nointelli").text.strip
    @info.url = page.css("a.nointelli").first.attr("href").strip
  end

  def self.scrape_recipes
    self.scrape_r_1
    self.scrape_r_2
  end

  def self.get_page_r_1
    Nokogiri::HTML(open("http://www.foodnetwork.com/recipes/food-network-kitchens/herb-roasted-chicken-with-melted-tomatoes-recipe.html"))
  end

  def self.scrape_r_1
    #scrapes and returns recipe information for dish 1 from Food Network
    page = self.get_page_r_1
    @info = Recipe::RecipesInfo.new
    @info.time = page.css("div section dl dd.o-RecipeInfo__a-Description--Total").text.strip
    @info.servings = page.css("dd.o-RecipeInfo__a-Description").text.gsub("30 min", "").gsub("Easy", "").strip
    @info.ingredients = page.css("div.o-Ingredients__m-Body ul li.o-Ingredients__a-ListItem").text.strip
    @info.instructions = page.css("div.o-Method__m-Body").text.strip
  end

  def self.get_page_r_2
    Nokogiri::HTML(open("http://www.mydailymoment.com/recipes/quick_and_easy_shepherd_s_pie.php"))
  end

  def self.scrape_r_2
    #scrapes and returns recipe information for dish 2 from My Daily Moment
    page = self.get_page_r_2
    @info = Recipe::RecipesInfo.new
    @info.time = "unknown"
    @info.servings = page.css("div.rr_ingredients div.rr_infodata").last.text.strip
    @info.ingredients = page.css("div.rr_introtext").text.gsub("Need a hearty homemade meal on the double? Mix up this amazing one-dish casserole that's sure to please even the pickiest eaters. It's hearty, healthful and on the table in a hurry.","").strip
    @info.instructions = page.css("div.instructions p").text.strip
  end

end
