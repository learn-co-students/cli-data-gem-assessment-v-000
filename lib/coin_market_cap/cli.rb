class CoinMarketCap::CLI

  def call

    puts "Welcome to the CoinMarketCap list Gem"
    puts "Type list to display the top 15 cryptocurrencies then choose the cryptocurrency:"

    input = nil

    while input == nildsds

      input = gets.strip

      if input == "list"
        puts "list of crypto"
      elsif input == "exit"
        break
      end

    end


  end

end
