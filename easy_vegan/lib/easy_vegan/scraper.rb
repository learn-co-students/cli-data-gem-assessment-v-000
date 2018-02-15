class EasyVegan::Scraper

  def self.titles(category_number)
    <<-HEREDOC
    1. Vegan Cinnamon Rolls
    2. 5-ingredient vegan Dark Chocolate Bars
    3. 5-ingredient Vegan Caramel Sauce
    4. Creamy Avocado Banana Green Smoothie
    HEREDOC
    self.scrape_recipe_page(category_number)
  end


  def self.scrape_index_page
    scraped_recipes = []
    doc = Nokogiri::HTML(open("https://minimalistbaker.com/recipe-index/"))
    doc.css("article a").each do |category|
        scraped_recipes << {
        :title => category.attr("title"),
        :url => category.attr("href")
      }
    end
    scraped_recipes
  end

  def self.scrape_categories
    scraped_categories = []
    doc = Nokogiri::HTML(open("https://minimalistbaker.com/recipe-index/"))
    widget_area = doc.css("div.widget-area.recipes-index")
    widget = widget_area.css("section.widget.featured-content.featuredpost.featured-recipes")
    widget.css("h4.widget-title.widgettitle").each do |category_name|
      #binding.pry
      scraped_categories << {
        :category => category_name.text
      }
    end
    scraped_categories
  end

#:total_time, :cuisine_category, :serving_size
  def self.scrape_recipe_page(url)
    recipe_profile = Nokogiri::HTML(open("https://minimalistbaker.com/caramel-apple-cheesecake-tart/"))
    recipe_details = {}
    binding.pry
    recipe_profile.css("div.ERSTimeItem")
    recipe_profile.css("div.ERSTimeItem div.totalTime")
  end


end
    #there are twelve recipe titles per category
      #title = doc.css("article a").attr("title").value
      #url = doc.css("article a").attr("href").value
      #
      # if index.between? (0, 12)
      #   :category => "All Recipes",
      # elsif index.between? (13, 24)
      #   :category => "Sweets",
      # elsif index.between? (25, 36)
      #   :category => "Entrees",
      # elsif index.between? (37, 48)
      #   :category => "Breakfast",
      # elsif index.between? (49, 60)
      #   :category => "Snack",
      # elsif index.between? (61, 72)
      #   :category => "Sides",
      # elsif index.between? (73, 84)
      #   :category => "Beverages",
      # end
