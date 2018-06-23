#CLI Controller
class CLI

  def call
    puts "Welcome to The Simple Collection by Tin Can Knits!"
    #scrape_page
    start
  end

  def start
    puts "For a list of patterns, please type patterns."
    input = gets.strip
    if input == "patterns"

    list = scrape_page
    print_patterns(list)

    else
      puts "I don't understand your response."
      start
    end

    puts "Which pattern would you like more information on?"
    input = gets.strip

    #more code here

    print_patterns(pattern)

    puts "Would you like to learn about another pattern? Please enter y or n."

    input = gets.strip
    if input == "y"
      start
    elsif input == "n"
      puts "Happy Knitting!"
    else
      puts "Please enter your answer again."
      start
    end
  end

  def scrape_page
    doc = Nokogiri::HTML(open("http://tincanknits.com/thesimplecollection.html"))
    stuff = doc.css("tr td a img.img-thumbnail-tight")
    names = stuff.map {|img|
      img.attr("alt")}
    names.uniq.select {|name|
      name != "Handmade in the UK" && name != "Knitting Basics PDF"}
    #puts doc.css("tr p:first-child span.pattnavtext")
  end

  def print_patterns(pattern)
    puts "#{pattern.name}"
    puts ""
    puts "Sizing: #{pattern.sizing}"
    puts "Materials: #{pattern.materials}"
    puts "Gauge: #{pattern.gauge}"
    puts "Suggested Needles #{pattern.suggested_needles}"
    puts "Notes: #{pattern.notes}"
    puts ""
    puts "#{pattern.description}"
  end

  def print_patterns(list)
    list.each_with_index do |pattern, index|
      puts "#{index+1}. #{pattern}"
    end
  end
end
