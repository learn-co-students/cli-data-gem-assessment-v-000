class EasyVegan::Scraper

  def self.titles(category_number)
    doc = Nokogiri::HTML(open("https://minimalistbaker.com/recipe-index/"))
    binding.pry



    <<-HEREDOC
    1. Vegan Cinnamon Rolls
    2. 5-ingredient vegan Dark Chocolate Bars
    3. 5-ingredient Vegan Caramel Sauce
    4. Creamy Avocado Banana Green Smoothie
    HEREDOC
  end



end
    #there are twelve recipe titles per category
      #title = doc.css("article a").attr("title").value
      #url = doc.css("article a").attr("href").value
