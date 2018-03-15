# Our CLI Controller
class Cryptonewbie::CLI
  attr_accessor :cryptos

  def call
    Cryptonewbie::Scraper.new.make_cryptos
    start
  end

  def list
    puts ""
    puts "************* Today's Crypto-Market *************"
    puts ""
    Cryptonewbie::Crypto.all.each.with_index(1) do |crypto, i|
      puts "#{i}. #{crypto.name}"
    end
    puts ""
  end

  def print_crypto(crypto)
    puts ""
    puts "-------------- #{crypto.name} --------------"

    puts ""
    puts "Current Price: #{crypto.price}"
    puts ""

    puts "Circulating Supply: #{crypto.circulating_supply}"
    puts ""

    puts "Percent-Change in the last 24HR(s): #{crypto.change}"
    puts ""
 end


  def start
    list
    input = nil
    while input != "exit"
      puts "Enter the Number or Name of the Cryptocurrency you'd like more info on!"
      puts ""
      puts "Enter list to see the market again."
      puts "OR"
      puts "Enter exit to end the program."
      puts ""
      input = gets.strip

      if input == "list"
        list
      elsif input.to_i == 0
        # if input is a string(name), strings when evaluated to integer return 0
        if crypto = Cryptonewbie::Crypto.find_by_name(input)
          print_crypto(crypto)
        end
      elsif input.to_i > 0
        if crypto = Cryptonewbie::Crypto.find(input.to_i)
          print_crypto(crypto)
        end
      end
    end
    puts""
    puts "RETURN AT ANY TIME TO VIEW THE TOP 5 CRYPTOCURRENCIES!"
    puts ""
  end
end



        # 3/14: puts "Would you like to read more"
        # answer = gets.strip
        # if ["Y", "YES"].include?(answer.upcase)
          # input => index of the story
          # content = Cryptonewbie::Crypto.scrape_specific_page(index)
