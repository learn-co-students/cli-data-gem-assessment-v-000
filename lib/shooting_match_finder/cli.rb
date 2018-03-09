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
  end

  def menu
    puts "Enter the number of the match you'd like more info about, or type exit."
    input = nil
    while input != "exit"
      input = gets.strip
      if input.to_i == 0
        puts "Please enter a match number."
      elsif input.to_i == 1
        puts "1. 2018 Berry's Steel Open - Date"
      elsif input.to_i == 2
        puts "2. SUPS Practical Pistol - Date"
      end
    end
  end

  def farewell
    puts "Come back again for more matches!"
  end

end
