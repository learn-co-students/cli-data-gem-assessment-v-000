require_relative '../Gemini'

  class Gemini::Scrapper
    def initialize
      @user_input = get_user_input
      self.scrap_website
    end

    def scrap_website
      puts "scrapping website"
    end

    def display_results
      #input = get_user_input
      case @input
      when "1"
        puts " 1 BTC = $10000"
        puts "The price increased/decreased by XX%"
      when "2"
        puts " 1 ETH = $800"
        puts "The price increased/decreased by YY%"
      when "3"
        puts "1 ETH = BTC0.070000000 "
        puts "The price increased/decreased by ZZ%"
      else
        puts "Selection unclear, please select the pair you want to check (1,2 or 3)"
        @input =  get_user_input
      end
      puts "display_results"
    end

    def get_user_input
      user_input = gets.to_s.strip
    end
  end
