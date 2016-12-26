class Recipe::Recipes

  attr_accessor :time, :servings, :ingredients, :instructions

  def self.scrape_recipes
    #Returns array of recipe information for dish 1 and dish 2
    recs = []
    recs << self.scrape_r_1
    recs << self.scrape_r_2
    recs
  end

  def self.scrape_r_1
    #scrapes and returns recipe information for dish 1 from Food Network
    r_page = Nokogiri::HTML(open("http://www.foodnetwork.com/recipes/food-network-kitchens/herb-roasted-chicken-with-melted-tomatoes-recipe.html"))
    r_info = self.new
    r_info.time = r_page.search("div.cooking-times dd.total").first.text
    r_info.servings = r_page.search("div.difficulty dd").first.text.strip
    r_info.ingredients = r_page.search("div.col8.ingredients li").text
    r_info.instructions = r_page.search("ul.recipe-directions-list").text.strip
    r_info
  end

  def self.scrape_r_2
    #scrapes and returns recipe information for dish 2 from My Daily Moment
    r_page = Nokogiri::HTML(open("http://www.mydailymoment.com/recipes/easy_brownies.php"))
    r_info = self.new
    r_info.time = r_page.search("div.rr_commenttext p").text.strip
    r_info.servings = r_page.search("div.rr_infodata").last.text.strip
    r_info.ingredients = r_page.search("div.rr_introtext div.ingredient li").text
    r_info.instructions = r_page.search("div.instructions ol.rr_method_list li").text.strip
    r_info
  end

end
