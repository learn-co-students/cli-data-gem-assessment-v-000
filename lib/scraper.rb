require 'open-uri'
require 'pry'

class Scraper
  # attr_accessor :doc, :article_title, :article_date, :article_text, :article_url, :comments_url


  def initialize(site_url)
    @doc = Nokogiri::HTML(open(site_url))
    parse(@doc)
    # @doc.css(".blog-post").each do |article|
    #   article_title = article.css(".blog-link").first.text,
    #   article_date = article.css(".date-text").text.gsub("\n\t\t", "").gsub("\n\t", ""),
    #   article_text = article.css(".paragraph").text,
    #   article_url = article.css(".blog-title-link blog-link").text, #find href for article
    #   comments_url = article.css(".blog-comments a @href").first.value,
    #   # binding.pry
    #   Article.new(article_title, article_date, article_text, article_url, comments_url)
    # end
    # binding.pry
  end

  def parse(nokogiri_file)
    nokogiri_file.css(".blog-post").each do |article|
      @article_title = article.css(".blog-title a").first.text,
      @article_info = article.css(".blog-date .date-text").first.children.text.gsub("\n\t\t", "").gsub("\n\t", ""),
      @article_text = article.css(".paragraph").text,
      @article_url = article.css(".blog-link @href").first.value, #find href for article
      @comments_url = article.css(".blog-comments a @href").first.value,
      binding.pry
      Article.new(@article_title, @article_info, @article_text, @article_url, @comments_url)
    end
  end

end
