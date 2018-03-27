require 'pry'

class ShootingMatchFinder::CLI

  BASE_PATH = "https://practiscore.com"

  def start
    create_matches
    add_attributes_to_match
    list_matches
    menu
    farewell
  end

  def create_matches
    matches = ShootingMatchFinder::Scraper.scrape_matches(BASE_PATH + '/search/matches')
    Match.new_from_practiscore(matches)
  end

  def add_attributes_to_match
    Match.show_matches.each do |match|
      attributes = ShootingMatchFinder::Scraper.scrape_from_match_url(BASE_PATH + match.match_url)
      match.add_attributes(attributes)
    end
  end

  def list_matches
    puts "Here are the matches in your area:"
    Match.show_matches.each.with_index(1){|match, i| puts "#{i}. #{match.name}"}
  end

  #def menu #I really don't like the way this menu is set up. I think I can find a better way to do this.
  #  input = nil
  #  while input != "exit"
  #    input = gets.strip
  #    if input.downcase == "list"
  #      list_matches
  #    elsif input.to_i == 1
  #      puts "More info on Match 1...."  #This should pull and show more info about a specific match.
  #    elsif input.to_i == 2
  #      puts "More info on Match 2...."
  #    else
  #      puts "Please enter a match number."
  #    end
  #  end
  #end

  def menu
    input = nil
    while input != "exit"
      puts "Enter a match number for more info, list to see matches, or type exit."
      input = gets.strip
      if input.to_i > 0 && input.to_i < Match.show_matches.length
        puts "#{Match.show_matches[input.to_i - 1].name}"
        puts "  #{Match.show_matches[input.to_i - 1].location}"
        puts "  #{Match.show_matches[input.to_i - 1].entry_fee}"
        puts "  #{Match.show_matches[input.to_i - 1].description}"
      elsif input.downcase == "list"
        list_matches
      else
        puts "Please enter a match number, or type exit."
      end
    end
  end

  def farewell
    puts "Come back again for more matches!"
  end

end
