#our CLI Controller
require_relative "./recipe.rb"
require_relative "./scraper.rb"
require 'pry'
class EasyVegan::CLI
  attr_accessor :input, :cat

  def call
    puts "Recipe Categories:"
    list_categories
    #remove line below after you find cuisine_category bug
    #EasyVegan::Scraper.scrape_recipe_page("https://minimalistbaker.com/raw-oreos/")
    menu
  end

  def list_categories
    categories = EasyVegan::Scraper.scrape_categories
    categories.each_with_index do |cat, index|
      puts "#{index+1}. #{cat}"
    end
  end

  def menu
    @input = ""
    puts "Which category of recipes would you like to explore? You may type a category to explore or type exit."
    @input = gets.strip.to_i
    if @input > 0 && @input <= EasyVegan::Scraper.scrape_categories.size

      #create all recipe objects
      make_recipe_objects

      #collect urls, send every url to be scraped. read_each_recipe_page automates the scraping of all individual recipe pages and adds all recipe attributes to recipe objects
      add_attributes_to_recipes

      #search by category (cli.search_by_category)
      check
      #search_and_print_by_category
    elsif @input == "exit"
      goodbye
    else
      puts "Sorry, please enter an appropriate integer."
    end
  end

  def convert_input_to_category

    case @input
      when 1
        print_all
      when 2
        search_for_dessert
      when 3
        search_for_entrees
      when 4
        "Breakfast"
      when 5
        search_for_snacks
      when 6
        "Side"
      when 7
        "Beverage"
      when 8
        search_for_gluten
      when 9
        search_for_vegan
      when 10
        "Helpful How-to"
      else
        puts "invalid entry"
      end
  end

  def check
    chek = convert_input_to_category
    if chek.class == String
        search_and_print_by_category
    end
  end

  def search_and_print_by_category
    category_wanted = convert_input_to_category
    recipe_objects = EasyVegan::Recipe.all
    index = 1
    relevant = []
    recipe_objects.each do |recipe|
      if recipe.category.include?("#{category_wanted}")
        #binding.pry
        relevant << recipe
        puts "#{index}. #{recipe.title}"
        index += 1
      end
    end
    print_recipe_details(relevant)
  end

  def print_recipe_details(relevant)
    puts "Which recipe would you like to know more about?"
    interest = gets.chomp.to_i - 1
    #recipes_to_print = search_and_print_by_category
    #binding.pry
    puts "Title: #{relevant[interest].title}"
    puts "Attributes: #{relevant[interest].cuisine_category}"
    puts "Serves: #{relevant[interest].serving_size}"
    puts "Recipe URL: #{relevant[interest].url}"
  end


  def goodbye
    puts "Come back soon for more vegan recipes!"
  end


#we need to refactor print such that it only prints recipes with category = input
#the recipe objects will not have a category attribute until add_attributes is run successfully. we need to carefully choose order of menu and call


  def make_recipe_objects
    recipe_objects = EasyVegan::Scraper.scrape_index_page
    EasyVegan::Recipe.create_from_collection(recipe_objects)

  end


#we need to only add the attributes of one recipe at time. at this point, attirbutes is holding everything

  def add_attributes_to_recipes
    EasyVegan::Recipe.all.each do |recipe|
      recipe.add_recipe_attributes(EasyVegan::Scraper.scrape_recipe_page(recipe.url))
      #binding.pry
    end
  end

  def search_for_vegan
    recipe_objects = EasyVegan::Recipe.all
    index = 1
    relevant = []
    recipe_objects.each do |recipe|
      if recipe.cuisine_category.include?("Vegan")
        #binding.pry
        relevant << recipe
        puts "#{index}. #{recipe.title}"
        index += 1
      end
    end
    print_recipe_details(relevant)
  end


  def search_for_gluten
    puts "gf options"
  end

  def search_for_entrees
    #include entree, soup, salad
    recipe_objects = EasyVegan::Recipe.all
    index = 1
    relevant = []
    recipe_objects.each do |recipe|
      if recipe.category.include?("Soup") || recipe.category.include?("Salad") || recipe.category.include?("Entrée")
        #binding.pry
        relevant << recipe
        puts "#{index}. #{recipe.title}"
        index += 1
      end
      relevant
    end
  end

  def search_for_snacks
    puts "snacks"
  end

  def search_for_dessert
    puts "desserts"
  end



=begin
//////////////methods for debugging only///////////////
def print_recipe_titles(input)
  @recipe_titles = EasyVegan::Scraper.scrape_index_page
  puts "Featured Recipes:"
  @recipe_titles.each_with_index do |recipe, index|
    if @recipe_titles.category.includes?(input)
      binding.pry
      puts "#{index+1}. #{recipe[:title]}"
    else
      puts "We can not find any recipes in the category you specified"
    end
  end
end

def print_categories
  recipe_objects = EasyVegan::Recipe.all
  cats = []
  recipe_objects.each do |recipe|
    cats << recipe.category
  end
    puts cats.uniq!
end
=end
end
