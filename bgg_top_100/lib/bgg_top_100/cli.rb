class BggTop100::CLI

  def call
    list_games
    menu
    goodbye
  end

  def list_games
    puts "Board Game Geek Top 100:"
    @games = BggTop100::Game.today
    @games.each.with_index(1) do |game, i|
      puts "#{i}. #{game.name} (#{game.year}) - #{game.rating}"
    end
  end

  def menu
    input = nil
    while input != "exit"
    puts "Enter the number of a game for more info or type list for game list or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0
        the_game = @games[input.to_i-1]
        puts "#{the_game.name} (#{the_game.year}) - #{the_game.rating}"
      elsif input == "list"
        list_games
      else
        puts "Not sure what you want, type list or exit."
      end
    end
  end

  def goodbye
    puts "Bye!"
  end
end
