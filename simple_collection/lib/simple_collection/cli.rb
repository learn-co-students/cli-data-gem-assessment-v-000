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
      puts "I don't understand your response. Please try again."
      start
    end

    puts "To see more information about a pattern, please enter its number."
    input = gets.strip.to_i

    pattern = list[input-1]
    pattern.scrape_pattern
    print_pattern(pattern)

    puts "Would you like to learn about another pattern? Please enter y or n."

    input = gets.strip
    if input == "y"
      start
    else input
      puts "Happy Knitting!"
    end
  end

  def scrape_page
    doc = Nokogiri::HTML(open("http://tincanknits.com/thesimplecollection.html"))
    page = doc.css("tr td a img.img-thumbnail-tight")
    patterns = page.map {|img|
      Pattern.new(img.attr("alt"), img.parent.attr("href"))}
    patterns = patterns.uniq {|patt| patt.name}
    patterns.select {|patt|
      patt.name != "Handmade in the UK" && patt.name != "Knitting Basics PDF"}
    #puts doc.css("tr p:first-child span.pattnavtext")
  end

  def print_pattern(pattern)
    puts "--------------------"
    puts ""
    puts "#{pattern.name}"
    puts ""
    puts "Sizing: #{pattern.size}"
    puts "Materials: #{pattern.materials}"
    puts "Gauge: #{pattern.gauge}"
    puts "Suggested Needles: #{pattern.suggested_needles}"
    puts "Notes: #{pattern.notes}"
    puts ""
    puts "#{pattern.description}"
    puts "--------------------"
    puts ""
  end

  def print_patterns(list)
    list.each_with_index do |pattern, index|
      puts "#{index+1}. #{pattern.name}"
    end
  end
  
  def goodbye
  end
    
end
