class Scraper
  
  def scrape_page
    doc = Nokogiri::HTML(open("http://tincanknits.com/thesimplecollection.html"))
    page = doc.css("tr td a img.img-thumbnail-tight")
    patterns = page.map {|img|
      Pattern.new(img.attr("alt"), img.parent.attr("href"))}
    patterns = patterns.uniq {|patt| patt.name}
    patterns.select {|patt|
      patt.name != "Handmade in the UK" && patt.name != "Knitting Basics PDF" && patt.name != "Grain by Tin Can Knits"}
    #puts doc.css("tr p:first-child span.pattnavtext")
  end


end