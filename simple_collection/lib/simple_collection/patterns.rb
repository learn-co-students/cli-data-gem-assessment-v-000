class SimpleCollection::Patterns

  attr_accessor :name, :position, :size, :materials, :gauge, :suggested_needles, :notes, :description

  @@all = []

  def initialize(name=nil, position=nil)
    @name = name
    @position = position
    @@all << self
  end

  def self.all
    @@all
  end
end
