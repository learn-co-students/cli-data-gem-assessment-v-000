require 'pry'
class BoxOffice::Gross

  attr_accessor :name, :boxoffice, :title, :gross

  def self.today
    objects = self.scrape_grosses
    arr = objects.first(5)
    arr
  end

  def self.scrape_grosses
    self.scrape_boxofficemojo
  end

  def self.scrape_boxofficemojo
    doc = Nokogiri::HTML(open("http://www.boxofficemojo.com/daily/chart/"))

    puts "Today's Top of the Box Office"

    movie = self.new
    
    titles = []
    movie.title = doc.css("table tr td table tr td b a").each do |e| 
      titles << e.text 
    end

    titles 
    # grosses = []
    #  movie.gross = doc.css("table tr td table tr td b p").each do |e| 
    #   grosses << e.text 
    # end
    # binding.pry

    # [titles, grosses]

  end

end

# 1. The jungle Book - 40 mil
# 2. the huntsman - 30 mil
# 3. barbershop - 20 mil

    # movie.title = doc.xpath("/html/body/div[@id='container']/div[@id='main']/div[@id='body']/center/table/tbody/tr[2]/td/table/tbody/tr[2]/td[2]/b/a").text


  # movie.boxoffice = doc.css("table tr td table tr td").first.attr("text")

# movie.title = doc.css('table')[8].css('tr').each do |mov|
#   new_movie = mov.css('td').each do |td|
#     td.text
#   end
#   new_movie.save
# end

#     doc.css('table')[8].css('tr').each do |mov|
# # HERE WE create a new Movie.new
#      new_movie = mov.css('td').each do |td|
# #Possibly here (or we can hard code it) we want to assign values to that new movie created above
#       td.text
#       end
#       new_movie.save
# #here we want to save that movie so the next iteration is a new movie object.
#     end

#movie.title = doc.css("table tr td table tr td b a").text

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