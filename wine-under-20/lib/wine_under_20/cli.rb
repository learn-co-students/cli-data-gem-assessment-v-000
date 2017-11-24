class WineUnder20::CLI

  def call
    puts "Find today's wines under $20 at Binny's. Press enter to continue."
    input = gets.chomp
    #input = gets.chomp
    list_wines
    menu
  end

  def list_wines
    @wines = WineUnder20::Wine.scrape_wines
    @wines.each.with_index(1) do |wine, i|
      puts "#{i}. #{wine.name} - #{wine.price}"
    end
  end

  def menu
    @wines = WineUnder20::Wine.scrape_wines
    puts "Enter the number of the deal you'd like more information on or type list to list all wines or type exit to leave."
    input = nil
    while input != "exit"
    input = gets.strip
    if input.to_i > 0 && input.to_i <= @wines.size
      the_wine = @wines[input.to_i - 1].description
      puts the_wine
      puts "Would you like to visit the product page for this bottle of wine? 'Y' to visit the site; 'N' to return to the listing of wines."
      visit = gets.strip
      if visit == "Y" then
        url = @wines[input.to_i - 1].url
        system("open", "#{url}")
        list_wines
      else list_wines
      end
    elsif input == "list"
      list_wines
      puts "Which wine do you want to learn more about?"
    elsif input == "exit"
      goodbye
    else
      puts "Not sure what you meant. Please type list or exit."
    end
  end
  end

  def goodbye
    puts "See you tomorrow for more deals!"
  end

end
