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

  end

  def farewell

  end

end
