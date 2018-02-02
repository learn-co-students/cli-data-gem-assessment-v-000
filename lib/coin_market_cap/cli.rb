class CoinMarketCap::CLI

  def call
    puts "Welcome to the CoinMarketCap list gem"
    list_top10
    user_input
  end

  def list_top10
    puts "List of the top 10 cryptocurrencies"
    @top10 = CoinMarketCap::Scraper.list
    @top10.each.with_index(1) { |coin, i| puts "#{i}. #{coin.name} / #{coin.price}$ / #{coin.mcap}$ / #{coin.change}" }
  end

  def user_input
    input = nil

    while input != "exit"
      puts "\nPlease choose a coin or exit:"
      input = gets.strip.downcase

      if input == "list"
        list_top10
      elsif input == "exit"
        puts "Bye bye, see you next time!"
        break
      elsif input.to_i.between?(1,10)
        coin = @top10[input.to_i - 1]

        #add the attibrutes to the object? and then display it
        if coin.website.nil?
          coin = CoinMarketCap::Scraper.get_coin(coin)
        end

        display_detail(coin)

      else
        puts "Please type a number, list or exit."
      end
    end
  end

  def display_detail(coin)
    puts "\n"
    puts "Coin: #{coin.name}"
    puts "Price: #{coin.price}"
    puts "Volume: #{coin.volume}"
    puts "Market Cap: #{coin.mcap}"
    puts "24H Change: #{coin.change}"
    puts "Circulating Supply: #{coin.cir_supply}"
    puts "Total Supply: #{coin.max_supply}"
    puts "Website: #{coin.website}"
    puts "Explorer: #{coin.explorer}"
    puts "Source: #{coin.source}"
  end
end
