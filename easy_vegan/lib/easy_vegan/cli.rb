#our CLI Controller
require 'pry'
class EasyVegan::CLI

  def call
    puts "Recipe Categories:"
    #stub
    list_categories
    menu
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
    puts "You may type a category number to explore, or type exit"
    input = gets.strip
    if input.to_i > 0 && input.to_i <= 7
      input = input.to_i
      print_recipe_titles(input)
    elsif input == "exit"
      goodbye
    end
  end

  def goodbye
    puts "Come back soon for more vegan recipes!"
  end

  def print_recipe_titles(input)
    @recipe_titles = EasyVegan::Recipe.titles(input)
    puts "Featured Recipes:"
    @recipe_titles.each_with_index do |title, index|
      puts "#{index}. #{title}"
    end
  end






end
