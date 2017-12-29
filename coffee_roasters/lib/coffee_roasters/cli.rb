class CoffeeRoasters::CLI

  def call
    puts ""
    puts "<<<<<<< Welcome to The 21 best Coffee Roasters in the US >>>>>>>"
    CoffeeRoasters::Scraper.new.scrape_roasters
    list_roasters(1)
    menu
  end


  def menu
    input = nil
    while input != 'exit'
      puts "Enter the number of the coffee roaster you'd like more info on:"
      puts "Or type 'A', 'B', 'C' or 'D' for the list - A: 1-5, B: 6-10, C: 10-15, D: 15-21 "
      puts "Or type 'exit':"

      input = gets.strip.downcase

      if input.to_i > 0
        roaster_detail(input.to_i-1)
      elsif input == "a"
        list_roasters(1)
      elsif input == "b"
        list_roasters(6)
      elsif input == "c"
        list_roasters(10)
      elsif input == "d"
        list_roasters(15)
      elsif input == "exit"
        goodbye
      else
        puts "Invalid input."
      end #if
    end #while
  end #def menu


  def list_roasters(from_number)
    if from_number == 15
      puts ""
      puts "-----------------< Coffee Roasters Top #{from_number} - #{from_number+6} >-----------------"
      puts ""
      @roaster = CoffeeRoasters::Roaster.all
      @roaster[from_number-1, 7].each.with_index(from_number) do |r, i|
        puts "#{i}. #{r.name} - #{r.location}"
        puts "#{r.bean}"
        puts ""
      end
      puts "----------------------------------------------------------"
    else
      puts ""
      puts "-----------------< Coffee Roasters Top #{from_number} - #{from_number+4} >-----------------"
      puts ""
      @roaster = CoffeeRoasters::Roaster.all
      @roaster[from_number-1, 5].each.with_index(from_number) do |r, i|
        puts "#{i}. #{r.name} - #{r.location}"
        puts "#{r.bean}"
        puts ""
      end
      puts "-------------------------------------------------------------"
    end
  end


  def roaster_detail(num)
    @roaster = CoffeeRoasters::Roaster.all
    the_roaster = @roaster[num]
    puts "--------------< #{num+1}: #{the_roaster.name.upcase} >--------------"
    puts ""
    puts "#{the_roaster.name} - #{the_roaster.location}"
    puts "#{the_roaster.bean}"
    puts ""
    puts "The detail: #{the_roaster.details}"
    puts ""
    puts "URL - #{the_roaster.url}"
    puts ""
    puts "--------------------------------------------------------------"
  end


  def goodbye
    puts "Enjoy your coffee!"
  end

end
