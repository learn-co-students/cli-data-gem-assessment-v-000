class NowPlayingCliGem::Movie
  attr_accessor :name, :summary, :stars

  def initialize(name = nil, url = nil)
      @name = name
      @url = url
    end

# Returning scraped data of the movies
    def self.all

    end

    def self.find(id)

    end

    def self.find_by_name(name)

    end

# Scraping summary data
    def summary

    end

# Scraping stars data
    def stars

    end

end
