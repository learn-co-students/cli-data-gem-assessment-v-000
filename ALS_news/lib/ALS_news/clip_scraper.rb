require "nokogiri"

class ALSNews::Clip_Scraper


  def clips_index
    doc = Nokogiri::HTML(open("https://alsnewstoday.com/category/social-clips/"))
    doc.css("article")
  end

  def create_clips
    clips_index.each do |article|
      ALSNews::Clip.new_from_index(article)
    end
  end


end
