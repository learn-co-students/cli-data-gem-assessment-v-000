class Article

  attr_accessor :title, :author, :date, :story, :comments

  @@all = []

  def initialize(article_hash)
    article_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

end
