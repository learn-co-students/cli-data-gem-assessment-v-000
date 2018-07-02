class Pattern

  attr_accessor :name, :url, :size, :materials, :gauge, :suggested_needles, :notes, :description

  @@all = []


  def initialize(name=nil, url=nil)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

end
