class Books
  attr_accessor :title, :author, :date, :url
  @@all = []

  def initialize(title, author, date)
    @title = title
    @author = author
    @date = date
  end
end
