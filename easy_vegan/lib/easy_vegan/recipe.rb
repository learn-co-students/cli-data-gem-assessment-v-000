class EasyVegan::Recipe
attr_accessor :category, :total_time, :cuisine_category, :serving_size, :url, :title

  def self.titles(category_number)
    @titles = []
    @titles << EasyVegan::Scraper.titles(category_number)
  end




end
