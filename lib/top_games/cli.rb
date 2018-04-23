class TopGames::CLI 
  
    def start
      puts "The top three RPG of all time listed under www.PCgamer.com are as follows:"
      game_rankings
      info_input
    end 
    
    def game_rankings
      games = TopGames::Game.ranking
  
      games.each.with_index(1) do |game, i|
        puts "#{i}. #{game.name}, #{game.release_date}"
      end 
    end 
    
    def info_input
      
      puts " Please make a select a game for a summary, using (1-3), or type rankings
      to see the list again, type EXIT to quit"
    
        input = gets.strip.downcase
       
        if input == "1" 
          puts TopGames::Game.scrape_summary[0]
          puts game_rankings
          sleep(5)
          info_input
           
        elsif input == "2"
          puts TopGames::Game.scrape_summary[1]
          puts game_rankings
          sleep(5)
          info_input
           
        elsif input == '3'
          puts TopGames::Game.scrape_summary[2]
          puts game_rankings
          sleep(5)
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
          puts "Thank you! Check back again sometime!!"
        end 
        
   end  