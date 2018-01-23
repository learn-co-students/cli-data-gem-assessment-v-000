class NowPlayingCliGem::Movie

  attr_accessor :title, :details, :stars, :url

  def self.today
    # Returning instances of the movies

    # puts <<-DOC
    #  1. Maze Runner: The Death Cure (2018) - Young hero Thomas embarks on a mission to find a cure for a  deadly disease known as the "Flare" - Rosa Salazar, Thomas Brodie-Sangster, Dylan O'Brien, Kaya Scodelario
    #  2. Hostiles (2017) - In 1892, a legendary Army captain reluctantly agrees to escort a Cheyenne chief and his family through dangerous territory -  Scott Shepherd, Rosamund Pike, Ava Cooper, Stella Cooper
    #DOC

    movie_1 = self.new
    movie_1.title = "Maze Runner: The Death Cure (2018)"
    movie_1.details = "Young hero Thomas embarks on a mission to find a cure for a deadly disease known as the 'Flare'"
    movie_1.stars = "Rosa Salazar, Thomas Brodie-Sangster, Dylan O'Brien, Kaya Scodelario"
    movie_1.url = "http://www.imdb.com/title/tt4500922/?ref_=inth_ov_tt"

    movie_2 = self.new
    movie_2.title = "Hostiles (2017)"
    movie_2.details = "In 1892, a legendary Army captain reluctantly agrees to escort a Cheyenne chief and his family through dangerous territory"
    movie_2.stars = "Scott Shepherd, Rosamund Pike, Ava Cooper, Stella Cooper"
    movie_2.url = "http://www.imdb.com/title/tt5478478/?ref_=inth_ov_tt"

    [movie_1, movie_2]

  end

end
