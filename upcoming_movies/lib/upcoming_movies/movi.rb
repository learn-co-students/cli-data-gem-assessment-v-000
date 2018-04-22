require  'nokogiri'
require 'open-uri'
require 'pry'

class Movie
  attr_accessor :name, :price, :availability, :url

  def self.today
    # Scrape woot and meh and then return deals based on that data
    self.scrape_upcoming_movies
  end

  def self.scrape_upcoming_movies
    movies = []

    movies << self.scrape_woot

    movies
  end

  def self.scrape_woot
    doc = Nokogiri::HTML(open("https://www.tribute.ca/toronto-movies-on/"))
    scrape_movie = doc.search(".content.base")
    #puts scrape_movie
    scrape_movie.each do |movie|
      puts movie

      movie_title = movie.css("li h2 children").text
      puts "hello"
      puts movie_title
      puts " "

    end
    #binding.pry
    movie = self.new
  #  movie.name = doc.search("h2.main-title").text.strip
  #  movie.price = doc.search("#todays-deal span.price").text.strip
  #  movie0..url = doc.search("a.wantone").first.attr("href").strip
  #  movie.availability = true

    movie
  end

  end
Movie.today
