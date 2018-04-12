class Article

  attr_accessor :article_title, :article_date, :article_text, :article_url, :comments_url

  @@all = []

  def initialize(article_title, article_info, article_text, article_url, comments_url)
# binding.pry
    @article_title = article_title
    @article_date = article_info[0]
    @article_text = article_text
    @article_url = article_url
    @comments_url = comments_url
    @@all << self
    # display_summary
    binding.pry
  end

  def self.all
    @@all
  end

  # def self.create_from_collection(article_array)
  #   article_array.each do |article|
  #     self.new(article)
  #   end
  # end

  # def display_summary
  #   counter = 0
  #   binding.pry
  #   self.all.each do |article|
  #     counter += 1
  #     puts "#{counter}. #{@article_title}  -  #{@article_date}"
  #   end
  # end




  # def display_news


end
