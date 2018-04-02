class ShootingMatchFinder::CLI

  BASE_PATH = "https://practiscore.com"

  def start
    create_matches
    add_attributes_to_match
    #list_matches
    match_scroller
    menu
    farewell
  end

  def create_matches #Scrapes and then passes an array of hashes to Match.rb
    matches = ShootingMatchFinder::Scraper.scrape_matches(BASE_PATH + '/search/matches')
    Match.new_from_practiscore(matches)
  end

  def add_attributes_to_match #Adds details to those newly created matches.
    Match.show_matches.each do |match|
      attributes = ShootingMatchFinder::Scraper.scrape_from_match_url(BASE_PATH + match.match_url)
      match.add_attributes(attributes)
    end
  end

  def list_matches #Lists out the created matches by iterating over Match @@all.
    puts "Here are the matches in your area:"
    Match.show_matches.each.with_index(1){|match, i| puts "#{i}. #{match.name}"}
  end

  def menu #Is able to show details about any match.
    input = nil
    while input != "exit"
      puts "Enter a match number for more info, list to see matches, or type exit."
      input = gets.strip
      if input.to_i > 0 && input.to_i - 1 < Match.show_matches.length
        puts ""
        puts "#{Match.show_matches[input.to_i - 1].name}"
        puts "  Start Time: #{Match.show_matches[input.to_i - 1].match_start}"
        puts "  Location:   #{Match.show_matches[input.to_i - 1].location}"
        puts "  Entry Fee:  #{Match.show_matches[input.to_i - 1].entry_fee}"
        puts "  #{Match.show_matches[input.to_i - 1].description}"
        puts ""
      elsif input.downcase == "list"
        list_matches
      else
        puts "Please enter a match number, or type exit."
      end
    end
  end

  def farewell #Says goodbye!
    puts "Come back again for more matches!"
  end

  def match_scroller
    #we want this to show 10 matches at a time, then ask the user for more, while also allowing #menu commands to work.
    Match.show_matches.each.with_index(1) do |match, i|
      10.times do
        puts "#{i}. #{match.name}"
      end
    end
  end

end
