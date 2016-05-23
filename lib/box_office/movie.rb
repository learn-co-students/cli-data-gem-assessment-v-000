require 'pry'
class BoxOffice::Movie

  attr_accessor :title

  def self.get_movie_titles
    titles = self.scrape_movie_titles
    titles.first(5)
  end

  def self.scrape_movie_titles
    doc = Nokogiri::HTML(open("http://www.boxofficemojo.com/daily/chart/"))
    
    titles = []
    doc.css("table tr td table tr td b a").each do |e| 
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

end
