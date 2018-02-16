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
    categories = EasyVegan::Scraper.scrape_categories
    categories.each_with_index do |cat, index|
      puts "#{index+1}. #{cat}"
    end
  end

  def menu
    input = ""
    puts "Which category of recipes would you like to explore? You may type a category number to explore, or type exit"
    input = gets.strip
    if input.to_i > 0 && input.to_i <= EasyVegan::Scraper.scrape_categories.size
        input = input.to_i
        #refactor below code to accept an argument of input
      print_recipe_titles
      EasyVegan::Scraper.read_each_recipe_page
    elsif input == "exit"
      goodbye
    end
  end

  def goodbye
    puts "Come back soon for more vegan recipes!"
  end

#we need to refactor print such that it only prints recipes with category = input
  def print_recipe_titles
    @recipe_titles = EasyVegan::Scraper.scrape_index_page
    puts "Featured Recipes:"
    @recipe_titles.each_with_index do |recipe, index|
      puts "#{index+1}. #{recipe[:title]}"
    end
  end

  def make_recipe_objects
    recipe_objects = EasyVegan::Scraper.scrape_index_page
    EasyVegan::Recipe.create_from_collection(recipe_objects)
    binding.pry
  end

  def add_attributes_to_students
    Recipe.all.each do |recipe|
      attributes = Scraper.scrape_recipe_page(url)
      recipe.add_recipe_attributes(attributes)
    end
  end








end
