require_relative '../Gemini'

  class Gemini::Scrapper
    def initialize
      self.scrap_website
    end

    def scrap_website
      puts "scrapping website"
    end

    def display_pairs
      puts "1 - BTC/USD"
      puts "2 - ETH/USD"
      puts "3 - ETH/BTC"
    end

    def number_of_results
      3
    end

    def display_percentage_and_variations(input)
      case input
      when "1"
        puts " 1 BTC = $10000"
        puts "The price increased/decreased by XX%"
        #return
      when "2"
        puts " 1 ETH = $800"
        puts "The price increased/decreased by YY%"
        #return
      when "3"
        puts "1 ETH = BTC0.070000000 "
        puts "The price increased/decreased by ZZ%"
        #return
      end
    end

  end
