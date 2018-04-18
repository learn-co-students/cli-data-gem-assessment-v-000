class TopGames::CLI 
  
  def start
    puts "The top three upcoming games from IGN are as follows:"
    game_rankings
    info_input
  end 
  
  def game_rankings
    # puts "1. God of war, PS4, april 20, 2018"
    # puts "2. Monster Hunter World, PC, TBA"
    # puts "3. Y's PC, TBA"
    @games = TopGames::Games.ranking
  end 
  
  def info_input
    puts " Please make a selection of a game using (1-3), or type rankings
    to see the list again, type EXIT to quit"
    input = gets.strip.downcase
    
    if input == "1"
      puts "GOW info"
      info_input
    elsif input == "2"
     puts "MHW info"
     info_input
    elsif input == "3"
    puts "Y'S info"
    info_input
    elsif input == "rankings"
    game_rankings
    info_input
    elsif input == "exit"
    quit_app
  else 
    puts "Uh oh, please make a selection 1-3 or exit to quit :]"
    info_input
  end 
end 

def quit_app
  puts "Please check back often to see new rankings and updates on games!"
end 
  
  end  