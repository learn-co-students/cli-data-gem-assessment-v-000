#our CLI Controller
class EasyVegan::CLI

  def call
    puts "Recipe Categories:"
    #stub
    list_categories
    menu
    goodbye
  end

  def list_categories
    puts "1. All recipes"
    puts "2. Sweets"
    puts "3. Entrees"
    puts "4. Breakfast"
    puts "5. Snack"
    puts "6. Sides"
    puts "7. Beverages"
  end

  def menu
    list_categories
    input = ""
    puts "Which category of recipes would you like to explore?"
    input = gets.strip
    while input != "exit"
      input = input.to_i
      print_recipe_titles(input)
    end
    if input == "exit"
      goodbye
    end
  end

  def goodbye
    puts "Come back soon for more vegan recipes!"
  end

  def print_recipe_titles(input)
    @recipe_titles = DailyDeal::Recipe.titles
    puts "Featured Recipes:"
    @recipe_titles.each_with_index(1) do |i, title|
      puts "#{i}. #{title}"
    end
  end






end
