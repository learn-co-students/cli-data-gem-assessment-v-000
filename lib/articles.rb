class Article

  attr_accessor :title, :date, :story, :comments_url

  @@all = []

  def initialize(article_hash)
    article_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_collection(article_array)
    article_array.each do |article|
      self.new(article)
    end
  end

end
