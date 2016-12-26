class Recipe::CLI

  def call
    list_dishes
    recipe_options
    choices
    final
  end

  def list_dishes
    # Displays a list of the 2 dish options using an instance variable of the dish array
    puts "Dish of the Day:"
    @d_today = Recipe::Dish.scrape_dishes
    @d_today.each.with_index(1) do |dish, i|
      puts "#{i}. #{dish.name}"
      puts "#{dish.url}"
    end
  end

  def recipe_options
    #Creates an instance variable for the recipe array
    @r_today = Recipe::Recipes.scrape_recipes
  end


  def choices
    #User chooses which dish they would like the
    #Returns recipe information for user's choice
    #Allows user to view the list again or exit from the program
    input = nil
    while input != "end"
      puts "Please enter the number for the dish you would like to learn more about."
      input = gets.strip
      if input.to_i == 1 || input.to_i == 2
        d_choice = @d_today[input.to_i-1]
        puts "#{d_choice.name}:"
        r_choice = @r_today[input.to_i-1]
        puts "Total Time: #{r_choice.time}"
        puts ""
        puts "Servings: #{r_choice.servings}"
        puts ""
        puts "Ingredients: #{r_choice.ingredients}"
        puts ""
        puts "Instructions: #{r_choice.instructions}"
      elsif input == "list"
        list_dishes
      else
        puts "Please enter 1 or 2. You may also enter list to see today's dishes again or end to leave."
      end
    end
  end

  def final
    puts "Check back tomorrow for new options!"
  end

end

