
class Slideshower::Search
attr_accessor :pictures, :name, :url
  def self.search
    puts "Pictures of:"
    subject = gets.strip
@pictures = "https://www.pexels.com/search/#{subject}"
puts @pictures
  end

def self.scrape

doc = Nokogiri::HTML(open("#{@pictures}"))

picture = self.new
picture.name = doc.search("img.photo-item__img").attribute("alt").value
picture.url = doc.search("img.photo-item__img").attribute("src").value
binding.pry
picture
end


end
