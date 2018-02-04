class CoinMarketCap::CLI

  def initialize
    puts "Welcome to the CoinMarketCap list gem!"
    list_top10
    user_input
  end

  def list_top10
    puts "\nList of the TOP10 cryptocurrencies:"
    @top10 = CoinMarketCap::Scraper.list
    @top10.each.with_index(1) { |coin, i|
      puts "#{i}. #{coin.name.upcase.colorize(:light_blue)} / #{coin.price}$ / #{coin.mcap}$ / #{color_change(coin.change)}"
    }
  end

  def user_input
    input = nil

    while input != "exit"
      puts "\nPlease choose a coin, display the list or exit:"
      input = gets.strip.downcase

      if input == "list"
        list_top10
      elsif input == "exit"
        puts "\nBye bye, see you next time!"
        break
      elsif input.to_i.between?(1,10)
        coin = @top10[input.to_i - 1]

        if coin.website.nil?
          coin = CoinMarketCap::Scraper.get_coin(coin)
        end

        display_detail(coin)
      else
        puts "Please type a number, list or exit. Try again!"
      end
    end
  end

  def display_detail(coin)
    puts "\n"
    puts "#{coin.name.upcase.colorize(:light_blue)}"
    puts "Price: #{coin.price}"
    puts "Volume: #{coin.volume}"
    puts "Market Cap: #{coin.mcap}"
    puts "24H Change: #{color_change(coin.change)}"
    puts "Circulating Supply: #{coin.cir_supply}"
    puts "Total Supply: #{coin.max_supply}"
    puts "Website: #{coin.website}"
  end

  def color_change(number)
    number = number.gsub("%", "").to_f
    (number < 0) ? "#{number.to_s}%".colorize(:red) : "#{number.to_s}%".colorize(:green)
  end
end
