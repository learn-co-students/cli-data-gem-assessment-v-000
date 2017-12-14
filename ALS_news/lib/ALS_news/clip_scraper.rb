require "nokogiri"

class ALSNews::Clip_Scraper


  def clips_index
    doc = Nokogiri::HTML(open("https://alsnewstoday.com/category/social-clips/"))
    doc.css("div#grid")
  end

  def create_clips
    clips_index.each do |index|
      ALSNews::Clip.new_from_index(index)
    end
  end


end
