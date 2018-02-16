class EasyVegan::Scraper

  def self.scrape_index_page
    scraped_recipes = []
    doc = Nokogiri::HTML(open("https://minimalistbaker.com/recipe-index/"))
    doc.css("article").each do |category|
        scraped_recipes << {
          :title => category.css("h2.entry-title").text,
          #:title => category.attr("title")
          :url => category.css("h2.entry-title a").attr("href").value
      }
    end
    scraped_recipes
  end


#we need a method that will collect all the urls from scraped_recipes. The collected URLS will be used as an
#within another method.
  def self.collect_urls
    scraped_recipes = self.scrape_index_page
    urls = []
      scraped_recipes.each do |recipe_obj|
        urls << recipe_obj[:url]
      end
    urls
  end

  #we need a method that will iterate through all the urls, and use each as an argument for scrape_recipe_page
  def self.read_each_recipe_page
    urls = self.collect_urls
    urls.each do |url|
      self.scrape_recipe_page(url)
    end
  end



  def self.scrape_categories
    scraped_categories = []
    doc = Nokogiri::HTML(open("https://minimalistbaker.com/recipe-index/"))
    widget_area = doc.css("div.widget-area.recipes-index")
    widget = widget_area.css("section.widget.featured-content.featuredpost.featured-recipes")
    widget.css("h4.widget-title.widgettitle").each do |category_name|
      #binding.pry
      scraped_categories << category_name.text
    end
    scraped_categories
  end

#:total_time, :cuisine_category, :serving_size
  def self.scrape_recipe_page(url)
    recipe_profile = Nokogiri::HTML(open(url))
    recipe_details = {}
    #recipe_profile.css("div.ERSTimes div.ERSTime.ERSTimeRight div.ERSTimeItem time").text

    #Grab the Cuisine type (ex- vegan, gluten-free)
    recipe_details[:cuisine_category] = recipe_profile.css("div.ERSCuisine").text.gsub("Cuisine: ", "")

    #Grab the serving serving_size (ex "8") --- should I convert this to an integer?
    recipe_details[:serving_size] = recipe_profile.css("div.ERSServes span").text

    #grab the category of recipe(aka desser, snack etc. )
    recipe_details[:category] = recipe_profile.css("div.ERSCategory").text.gsub("Recipe type: ", "")

  recipe_details
  end

end
