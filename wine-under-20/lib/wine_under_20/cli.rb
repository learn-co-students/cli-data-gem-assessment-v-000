class WineUnder20::CLI

  def call
    puts "Find today's wines under $20 at Binny's. Press enter to continue."
    input = gets.chomp
    #input = gets.chomp
    list_wines
    menu
    goodbye
  end

  def list_wines
    @wines = WineUnder20::Wine.scrape_wines
    @wines.each.with_index(1) do |wine, i|
      puts "#{i}. #{wine.name} - #{wine.price}"
    end
  end

  def menu
    puts "Enter the number of the deal you'd like more information on or type list to list all wines or type exit to leave."
    input = nil
    while input != "exit"
    input = gets.strip
    if input.to_i > 0
      the_wine = @wines[input.to_i - 1]
      puts "#{the_wine.name} - #{the_wine.price}"
    elsif input == "list"
      list_deals
    else
      puts "Not sure what you meant. Please type list or exit."
    end
  end
  end

  def goodbye
    puts "See you tomorrow for more deals!"
  end

end
