class SimpleCollection::Patterns

  attr_accessor :name, :url, :size, :materials, :gauge, :suggested_needles, :notes, :description

  @@all = []

  def self.new_from_index_page(p)
    self.new(
    p.css().text,

    )
  end

  def initialize(name=nil, url=nil)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end



  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end
