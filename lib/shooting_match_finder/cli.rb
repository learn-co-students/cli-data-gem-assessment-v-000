class ShootingMatchFinder::CLI

  def start
    list_matches
    menu
    farewell
  end

  def list_matches
    puts "Here are the matches in your area:"
    puts <<-DOC
    1. 2018 Berry's Steel Open - Date
    2. SUPS Practical Pistol - Date
    3. Other match - date
    DOC
    puts "Enter a match number for more info, list to see matches again, or type exit."
  end

  def menu
    input = nil
    while input != "exit"
      input = gets.strip
      if input.downcase == "list"
        list_matches
      elsif input.to_i == 1
        puts "1. 2018 Berry's Steel Open - Date"
      elsif input.to_i == 2
        puts "2. SUPS Practical Pistol - Date"
      else
        puts "Please enter a match number."
      end
    end
  end

  def farewell
    puts "Come back again for more matches!"
  end

end
