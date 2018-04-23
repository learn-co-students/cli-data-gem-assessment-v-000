require  'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  def get_page
    Nokogiri::HTML(open("https://www.cineplex.com/Movies/ComingSoon"))
  end

  def scrape_comingsoon_movies
       movies = []
       doc = get_page.css(".showtime-card.showtime-single")

      # binding.pry

    #  scraper_doc   = doc.css(".showtime-card .showtime-single")



      doc.each do |movie_row|

        title = movie_row.search("h3.showtime-card--title").text
        genre =  movie_row.search("p.movie-genres").text
      #  genre =  movie_row.search("p.movie-details.movie-genres").text
      #  rating = movie_row.search("h3.showtime-card--title").text
        puts title.strip
        puts genre.strip
        time = genre[1,5]
        puts "time"
        puts time
      #  puts "test
    end
       puts movies
       #binding.pry
  end

  #def make_restaurants
  #  scrape_restaurants_index.each do |r|
  #    WorldsBestRestaurants::Restaurant.new_from_index_page(r)
  #  end
  #end
end

s = Scraper.new
s.scrape_comingsoon_movies
