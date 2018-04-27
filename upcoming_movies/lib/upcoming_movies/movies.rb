class UpcomingMovies::Movies
  
    attr_accessor :review_rating, :video_url, :rating_us, :rating, :new_title, :review_url, :url, :genre
  
    @@all = []
  
    def self.new_from_index_page(movie_row)
      self.new(
      review_rating =  movie_row.css("div.moviedesc div.valmain").text,
      @video_url = "https://www.cinemaclock.com#{movie_row.css("div.moviedesc > a.button16.btnvid").attribute("href").text}",
      @rating_us = movie_row.css("h3.movietitle span.rtUS").text.strip,
      @rating = movie_row.css("h3.movietitle span").text.strip,
      @title =  movie_row.css("h3.movietitle a").text.strip,
      @review_url = "https://www.cinemaclock.com#{movie_row.css("h3.movietitle a").attribute("href").text}",
      @url =  "https://www.cinemaclock.com#{movie_row.css("div.moviedesc a").attribute("href").text}",
      @genre  =  movie_row.css("p.moviegenre").text.strip

      #@new_title =  title.split(rating)
      #@new_title.delete_if {|sentence| sentence  == rating}
  
      
      
      #@genre_array =  genre.split(" • ")
      #@duration   =   genre_array[0]
      #@genre_a    =  genre_array[1]
      #genre_director  =  genre_array[2]
      
        )
    end
  
    def initialize(review_rating=nil, video_url=nil, rating_us=nil, rating=nil, title=nil, review_url=nil, url=nil, genre=nil )
      @review_rating  =   review_rating
      @video_url      =   video_url
      @rating_us      =   rating_us 
      @rating         =   rating_us 
      @rating         =   rating
      @title          =   title
      @review_url     =   review_url
      @url            =   url
      @genre        =   genre




      @@all << self
      puts review_rating
      puts video_url
      puts rating_us
      puts rating
      puts review_url
      puts url
      puts genre
      puts " "

    end
  
    def self.all
      @@all
    end
  
    def self.find(id)
      self.all[id-1]
    end
  
  end
