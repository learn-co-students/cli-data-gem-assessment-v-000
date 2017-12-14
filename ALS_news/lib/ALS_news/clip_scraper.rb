require 'pry'
require 'nokogiri'
require 'open-uri'

class ALSNews::Clip_Scraper


  def create_clips
    doc = Nokogiri::HTML(open("https://alsnewstoday.com/category/social-clips/"))
    doc.css("article.blog-item").each do |article|
      ALSNews::Clip.new_from_index(article)
    end
  end


end
