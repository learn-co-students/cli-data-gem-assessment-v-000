class EasyVegan::Scraper

  def self.scrape_index_page
    scraped_recipes = []
    doc = Nokogiri::HTML(open("https://minimalistbaker.com/recipe-index/"))
    doc.css("article").each do |category|
      #binding.pry
        scraped_recipes << {
          :title => category.css("h2.entry-title").text,
          #:title => category.attr("title")
          :url => category.css("h2.entry-title a").attr("href").value
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
      scraped_categories << category_name.text
    end
    scraped_categories
  end

#:total_time, :cuisine_category, :serving_size
  def self.scrape_recipe_page(url)
    recipe_profile = Nokogiri::HTML(open("https://minimalistbaker.com/caramel-apple-cheesecake-tart/"))
    recipe_details = {}
    binding.pry
    #a = recipe_profile.css("div.ERSTime.ESRTimeRight").text
    #div.[itemprop="totalTime"]").text
  #  a.css("div.totalTime").text

  #Grab the Cuisine type (ex- vegan, gluten-free)
  #recipe_details[:cuisine_category] = recipe_profile.css("div.ERSCuisine").text.gsub("Cuisine: ", "")

  #Grab the serving serving_size (ex "8") --- should I convert this to an integer?
  #recipe_details[:serving_size] = recipe_profile.css("div.ERSServes span").text
  end


end
