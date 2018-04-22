require  'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  def get_page
    Nokogiri::HTML(open("https://www.cineplex.com/Movies/ComingSoon"))
  end

  def scrape_comingsoon_movies
       movies = []
       doc = get_page.css("h3")

      scraper_doc   = doc.css(".showtime-card .showtime-single")

      scraper_doc.each do |movie_row|
        puts movie_row
      movies <<
        {
          :name =>  movie_row.attr("href"),
          :genre =>  movie_row.css(".movie-details .movie-genres").text,
          :profile_url =>  movie_row.attr("href")
        }
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
