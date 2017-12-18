
class ALSNews::Clip_Scraper


  def create_clips
    doc = Nokogiri::HTML(open("https://alsnewstoday.com/category/social-clips/"))
    doc.css("article.blog-item").each do |article|
      url = article.css("h1.entry-title").css("a").attribute("href").value
      doc2 = Nokogiri::HTML(open(url))

      ALSNews::Clip.new(
              article.css("time").text,
              article.css("h1.entry-title").css("a").text,
              url,
              article.css("div.entry-summary").text,
              doc2.css(".pf-content").css("p").text
              )
    end
  end


end
