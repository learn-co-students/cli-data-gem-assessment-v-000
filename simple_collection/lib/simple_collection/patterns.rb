class SimpleCollection::Patterns

  attr_accessor :name, :position, :size, :materials, :gauge, :suggested_needles, :notes, :description

  @@all = []

  def self.new_from_index_page(p)
    self.new(
    p.css().text,
    
    )

  def initialize(name=nil, position=nil)
    @name = name
    @position = position
    @@all << self
  end

  def self.all
    @@all
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end
