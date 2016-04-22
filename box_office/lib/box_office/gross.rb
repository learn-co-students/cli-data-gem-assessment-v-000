class BoxOffice::Gross

  attr_accessor :name, :boxoffice

  def self.today
    self.scrape_grosses
  end

  def self.scrape_grosses
    grosses = []

    grosses << self.scrape_boxofficemojo
    grosses
  end

  def self.scrape_boxofficemojo
    doc = Nokogirl::HTML(open("http:www.boxofficemojo.com"))

    binding.pry
  end
end





#old code

    # should return a bunch of instances of grosses
    # puts "Today's Box Office Grosses:"
    # puts <<-DOC
    #   1. Jungle Book
    #   2. Star Wars
    # DOC

    # gross_1 = self.new
    # gross_1.name = "Jungle Book"
    # gross_1.boxoffice = "$21.5"

    # gross_2 = self.new
    # gross_2.name = "Star Wars"
    # gross_2.boxoffice = "$14.2"

    # [gross_1, gross_2]