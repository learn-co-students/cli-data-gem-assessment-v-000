class Recipe::CLI

  @@d_info = Recipe::DishesInfo.all
  @@r_info = Recipe::RecipesInfo.all

  def call
    Recipe::Scraper.scrape_dishes
    list_dishes
    Recipe::Scraper.scrape_recipes
    choices
    final
  end

  def list_dishes
    # Displays a list of the 2 dish options using an instance variable of the dish array
    puts ""
    puts "Dishes of the Day:"
    puts ""
    @@d_info.each.with_index(1) do |dish, i|
      puts "#{i}. #{dish.name}"
      puts ""
      puts "link: #{dish.url}"
      puts ""
    end
  end

  def choices
    #User chooses which dish they would like the
    #Returns recipe information for user's choice
    #Allows user to view the list again or exit from the program
    input = nil
    while input != "end"
      puts ""
      puts "Please enter the number for the dish you would like to learn more about."
      puts ""
      input = gets.strip
      if input.to_i == 1 || input.to_i == 2
        @d_choice = @@d_info[input.to_i-1]
        @r_choice = @@r_info[input.to_i-1]
        puts ""
        puts "#{@d_choice.name}:"
        puts ""
        puts "Total Time: #{@r_choice.time}"
        puts ""
        puts "Servings: #{@r_choice.servings}"
        puts ""
        puts "Ingredients: #{@r_choice.ingredients}"
        puts ""
        puts "Instructions: #{@r_choice.instructions}"
      elsif input == "list"
        list_dishes
      elsif input != "end"
        puts "Please enter 1 or 2. You may also enter list to see today's dishes again or end to leave."
      end
    end
  end

  def final
    puts "Check back tomorrow for new options!"
  end

end
