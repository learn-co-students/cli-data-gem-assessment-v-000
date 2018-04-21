class UpcomingMovies::Movies
  attr_accessor  :name, :price, :url

  def self.today
    puts   <<-DOC
      1.  DDDDDDD
      2. DDDDDDDDDD
    DOC

    movie_1 = self.new
    movie_1.name = "Hello world"
    movie_1.price = "$10"
    movie_1.url  = "www.google.com"

    movie_2 = self.new
    movie_2.name = "2Hello world"
    movie_2.price = "2$10"
    movie_2.url  = "www.google.com"

     [movie_1, movie_2]


  end

end
