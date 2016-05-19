require 'pry'
class BoxOffice::Gross # or maybe Movie?

  attr_accessor :title

  def self.get_movie_titles
    titles = self.scrape_movie_titles
    titles.first(5)
  end


  def self.scrape_movie_titles
    doc = Nokogiri::HTML(open("http://www.boxofficemojo.com/daily/chart/"))

    puts "Today's Top of the Box Office"

    movie = self.new # Do we need to create objects in  *this* method?
    
    titles = []
    # What is the assignmenbt below doing - if anything?
    movie.title = doc.css("table tr td table tr td b a").each do |e| 
      titles << e.text 
    end

    titles 

  end

  def self.scrape_grosses_1
    doc = Nokogiri::HTML(open("http://www.fandango.com/boxoffice"))
    gross = self.new

    gross = doc.css("td.movieTitle + td").text
    gross = gross.split("\n")
    gross.select!{|a| a.include?("M")}
    gross[0].strip

  end

  def self.scrape_grosses_2
    doc = Nokogiri::HTML(open("http://www.fandango.com/boxoffice"))
    gross = self.new

    gross = doc.css("td.movieTitle + td").text
    gross = gross.split("\n")
    gross.select!{|a| a.include?("M")}
    gross[1].strip

  end

  def self.scrape_grosses_3
    doc = Nokogiri::HTML(open("http://www.fandango.com/boxoffice"))
    gross = self.new

    gross = doc.css("td.movieTitle + td").text
    gross = gross.split("\n")
    gross.select!{|a| a.include?("M")}
    gross[2].strip

  end

  def self.scrape_grosses_4
    doc = Nokogiri::HTML(open("http://www.fandango.com/boxoffice"))
    gross = self.new

    gross = doc.css("td.movieTitle + td").text
    gross = gross.split("\n")
    gross.select!{|a| a.include?("M")}
    gross[3].strip

  end

  def self.scrape_grosses_5
    doc = Nokogiri::HTML(open("http://www.fandango.com/boxoffice"))
    gross = self.new

    gross = doc.css("td.movieTitle + td").text

    gross = gross.split("\n")
    gross.select!{|a| a.include?("M")}
    gross[4].strip

  end

  def self.scrape_theaters_5
    doc = Nokogiri::HTML(open("http://www.fandango.com/boxoffice"))
    theaters = self.new

    theaters = doc.css("td.movieTitle + td + td").text

    theaters = theaters.split("\n")
    # theaters.select!{|a| a.exclude?("                                    ")}
    # theaters.select!{|a| a.include?("=~ /^[-+]?[1-9]([0-9]*)?$/")}
    theaters[4].strip

  end

end

  # def self.scrape_grosses_1
  #   doc = Nokogiri::HTML(open("http://www.boxofficemojo.com/daily/chart/"))
  #   gross = self.new

  #   gross = doc.css("table tr td table tr td b a").first.text
    

  #   gross

  # end

    # grosses = []
    #  movie.gross = doc.css("table tr td table tr td b p").each do |e| 
    #   grosses << e.text 
    # end

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