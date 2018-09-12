class CoffeeRoasters::CLI

  attr_accessor :roaster

  def call
    puts ""
    puts "<<<<<<<<<< Welcome to The 21 Best Coffee Roasters cli gem! >>>>>>>>>"
    CoffeeRoasters::Scraper.new.scrape_roasters
    @roaster = CoffeeRoasters::Roaster.all
    menu
  end

  def menu
    input = nil
    while input != 'exit'
      puts ""
      puts ">>> Enter the range of the coffee roaster you'd like info on: <<<"
      puts "1-5, 6-10, 11-15, 16-21"
      puts "Or type 'exit'."

      input = gets.strip.downcase
      if input.to_i.between?(1, 21)
        list_roasters(input.to_i)
      elsif input == 'exit'
        goodbye
      else
        puts "invalid input."
      end

      puts ">>> Which coffee roaster would you like more info on: <<<"
      input = gets.strip.downcase
      if input.to_i.between?(1, 21)
        roaster_detail(input.to_i-1)
      elsif input == "exit"
        goodbye
      else
        puts "invalid input."
      end
    end
  end

  def list_roasters(from_number)
    puts ""
    puts "-------------< Coffee Roasters #{from_number} - #{from_number+4} >-------------"
    puts ""
    @roaster[from_number-1, 5].each.with_index(from_number) do |roaster, index|
      puts "#{index}. #{roaster.name} - #{roaster.location}"
      puts "#{roaster.bean}"
      puts ""
    end
  end

  def roaster_detail(num)
    the_roaster = @roaster[num]
    puts "==========={ #{num+1}: #{the_roaster.name.upcase} }==========="
    puts ""
    puts "#{the_roaster.name} - #{the_roaster.location}"
    puts ""
    puts "#{the_roaster.bean}"
    puts ""
    puts "#{the_roaster.details}"
    puts ""
    puts "URL - #{the_roaster.url}"
    puts ""
    puts "=========================================================="
  end

  def goodbye
    puts "Thanks for visiting. Enjoy your coffee!"
    exit
  end

end
