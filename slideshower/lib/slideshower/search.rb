
class Slideshower::Search
attr_accessor :pictures, :subject

  def self.search
    @subject = gets.gsub! /\s/, '+'
    @pictures = "https://www.pexels.com/search/#{@subject}"
  end

  def self.subject
    @subject.gsub(/([+])/, ' ')
  end

def self.scrape
  doc = Nokogiri::HTML(open("#{@pictures}"))

  doc.css(".photo-item a").each do |foto|
  picture = Photo.new
  picture.name = foto.attribute("title")
  picture.url = foto.attribute("href").value
  end
end

end #of Class
