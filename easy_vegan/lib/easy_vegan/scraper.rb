class EasyVegan::Scraper

  def self.titles(category_number)
    <<-HEREDOC
    1. Vegan Cinnamon Rolls
    2. 5-ingredient vegan Dark Chocolate Bars
    3. 5-ingredient Vegan Caramel Sauce
    4. Creamy Avocado Banana Green Smoothie
    HEREDOC
    self.scrape_index_page
  end


  def self.scrape_index_page
    doc = Nokogiri::HTML(open("https://minimalistbaker.com/recipe-index/"))
    doc.each_with_index do |category, index|
      binding.pry
      category.each do |x|
        scraped_recipes << {
        :title => x.css("article a").attr("title").value,
        :url => x.css("article a").attr("href").value
      }
      end
    end
  end



end
    #there are twelve recipe titles per category
      #title = doc.css("article a").attr("title").value
      #url = doc.css("article a").attr("href").value
