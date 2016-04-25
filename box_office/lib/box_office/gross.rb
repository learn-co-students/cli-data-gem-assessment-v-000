class BoxOffice::Gross

  attr_accessor :name, :boxoffice, :title

  def self.today
    self.scrape_grosses
  end

  def self.scrape_grosses
    grosses = []

    grosses << self.scrape_boxofficemojo
  
    grosses
  end

  def self.scrape_boxofficemojo
    doc = Nokogiri::HTML(open("http://www.boxofficemojo.com/daily/chart/"))

    movie = self.new
    movie.title = doc.css("table tr td table tr td b a").text
    movie.title.each do |film|
      film
    end
    movie.boxoffice = doc.css("table tr td table tr td").first.attr("text")

    movie

  end

end

    # second_movie = doc.css("table tr td table tr td b a").first(2)

    # binding.pry

    #url = doc.search("a.wantone").first.attr("href")


# title = doc.search('table.tbody.tr.td.b.a').text
# first_movie = doc.css("table tr td table tr td b a").first.text

# second_movie = doc.css("table tr td table tr td b a").first(2)

# first_movie = doc.css("table tr td table tr td b a")

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