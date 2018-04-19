class TopGames::CLI 
  
  def start
    puts "The top three upcoming games from IGN are as follows:"
    game_rankings
    info_input
  end 
  
  def game_rankings
    @games = TopGames::Game.ranking
  end 
  
  def info_input
    puts " Please make a selection of a game using (1-3), or type rankings
    to see the list again, type EXIT to quit"
    input = gets.strip.downcase
   
    if input.to_i > 0 
      puts @games[input.to_i - 1]
     
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