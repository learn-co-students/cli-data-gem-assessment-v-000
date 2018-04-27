require  'nokogiri'
require 'open-uri'
require 'pry'

class UpcomingMovies::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.cinemaclock.com/movies/top-10"))
  end

  def scrape_comingsoon_movies
      get_page.css("#CT div.BD .movieblock")
  end   

  def make_comingsoon_movies
    puts "jjjjjjjjjjjjjjjjjS"
    scrape_comingsoon_movies.css(".movieblock").each do |movie_row|
      UpcoimgMovies::Movies.new_from_index_page(movie_row)
    end
  end

end

s = Scraper.new
s.make_comingsoon_movies