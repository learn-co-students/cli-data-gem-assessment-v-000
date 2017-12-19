require_relative './photo.rb'

class Slideshower::Search
attr_accessor :pictures, :name, :url, :picture, :subject

  def self.search
    puts "Pictures of:"
    @subject = gets.strip
@pictures = "https://www.pexels.com/search/#{@subject}"
puts @pictures
  end

def self.scrape
doc = Nokogiri::HTML(open("#{@pictures}"))

doc.css(".photo-item a").each do |foto|
  picture = Photo.new
picture.name = foto.attribute("title").value
 picture.url = foto.attribute("href").value

end
end

def self.print
  self.scrape
  Photo.all.each do|x|

  end
end

end #of Class
