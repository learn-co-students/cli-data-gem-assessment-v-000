require "nokogiri"
require "pry"
require "open-uri"

class Scraper
  
  @@all = []
  
  def self.getinfo
    booklist = Nokogiri::HTML(open("https://litreactor.com/columns/storyville-3-essential-books-you-should-read-in-every-major-genre/"))
  end
  
  def self.getgen
    allgen = []
    booklist.css("h2"). each do |gen| allgen << gen.text.tr("\n\t", "")
      binding.pry
    end
  end
end
  
  # def getgenre
  #   self.getinfo.css("h2")
  # end
  
  # def makegenre
  #   getgenre.each do |gen|
  #     binding.pry 
  #   end
  # end
