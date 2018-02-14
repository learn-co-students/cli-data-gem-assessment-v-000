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
    input = ""
    puts "Which category of recipes would you like to explore?"
    input = gets.strip
    while input != "exit"
      input = input.to_i
      print_cat_recipes(input)
    end
      menu
  end

  def goodbye
    puts "Come back soon for more vegan recipes!"
  end

  def print_cat_recipes(input)
    cat_recipes = Scaper.new(input).scrape_titles
    puts "Featured Recipes:"
    cat_recipes.each_with_index(1) do |i, title|
      puts "#{i}. #{title}"
    end
  end






end
