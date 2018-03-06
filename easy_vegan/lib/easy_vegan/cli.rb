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
    raw = gets.strip
    @input = raw.to_i
    if @input > 0 && @input <= EasyVegan::Scraper.scrape_categories.size
      puts "Please be patient as the recipe database loads."
      #create all recipe objects
      make_recipe_objects

      #collect urls, send every url to be scraped. read_each_recipe_page automates the scraping of all individual recipe pages and adds all recipe attributes to recipe objects
      add_attributes_to_recipes

      #trigger the correct search function with check. Check eventually calls on print_recipe_details (cli.search_by_category)
      check
    elsif raw == "exit"
      goodbye
    else
    #if @input > EasyVegan::Scraper.scrape_categories.size || @input < 0
      #binding.pry
      puts "Sorry, please enter an appropriate integer."
      menu
    end
  end

  def convert_input_to_category
    case @input
      when 1
        print_all
      when 2
        #["Dessert", "Frosting"]
        search_for_sweets
      when 3
        #["Entrée", "Soup", "Salad"]
        search_for_entrees
        #search_for_keywords(["Entrée", "Soup", "Salad"])
      when 4
        "Breakfast"
      when 5
        #["Dip", "Appetizer", "Smoothie", "Sauce"]
        search_for_snacks
      when 6
        "Side"
      when 7
        "Beverage"
      when 8
        search_for_recipe_attribute("Gluten-Free")
      when 9
        search_for_recipe_attribute("Vegan")
      when 10
        search_by_title_keyword("How To")
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

    raw = gets.chomp
    interest = raw.to_i - 1

      if interest > relevant.size || interest <= 0
        puts "Sorry, please enter an appropriate integer or exit the program by typing exit."
        print_recipe_details(relevant)
      elsif raw == "exit"
          goodbye
      else
        #recipes_to_print = search_and_print_by_category
        #binding.pry
        puts "Title: #{relevant[interest].title}"
        puts "Attributes: #{relevant[interest].cuisine_category}"
        puts "Serves: #{relevant[interest].serving_size}"
        puts "Recipe URL: #{relevant[interest].url}"
        secondary_menu
      end
  end

  def secondary_menu
    puts "What would you like to do now?"
    puts "Type exit to exit the program or type back to see the main menu again"
    input_2 = gets.strip
      if input_2 == "exit"
        goodbye
      elsif input_2 == "back"
        list_categories
        puts "Which category of recipes would you like to explore? You may type a category to explore or type exit."
        input_2 = gets.strip.to_i
        check
      else
        puts "Please enter a valid integer"
        secondary_menu
      end
    end

  def goodbye
    puts "Come back soon for more vegan recipes!"
  end

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

def search_for_recipe_attribute(keyword)
  recipe_objects = EasyVegan::Recipe.all
  index = 1
  relevant = []
  recipe_objects.each do |recipe|
    if recipe.cuisine_category.include?("#{keyword}")
      relevant << recipe
      puts "#{index}. #{recipe.title}"
      index += 1
    end
  end
  print_recipe_details(relevant)
end

def print_all
  recipe_objects = EasyVegan::Recipe.all
  index = 1
  relevant = []
  recipe_objects.each do |recipe|
      relevant << recipe
      puts "#{index}. #{recipe.title}"
      index += 1
  end
  print_recipe_details(relevant)
end


def search_by_title_keyword(keyword)
    recipe_objects = EasyVegan::Recipe.all
    index = 1
    relevant = []
    recipe_objects.each do |recipe|
      if recipe.title.include?("#{keyword}")
        relevant << recipe
        puts "#{index}. #{recipe.title}"
        index += 1
      end
    end
  print_recipe_details(relevant)
end

  def search_for_entrees
    #include entree, soup, salad
    recipe_objects = EasyVegan::Recipe.all
    index = 1
    relevant = []
    recipe_objects.each do |recipe|
      if recipe.category.include?("Soup") || recipe.category.include?("Salad") || recipe.category.include?("Entrée")
        relevant << recipe
        puts "#{index}. #{recipe.title}"
        index += 1
      end
    end
    print_recipe_details(relevant)
  end


  def search_for_snacks
    #include dip, appetizer, smoothie, sauce
    recipe_objects = EasyVegan::Recipe.all
    index = 1
    relevant = []
    recipe_objects.each do |recipe|
      if recipe.category.include?("Dip") || recipe.category.include?("Appetizer") || recipe.category.include?("Smoothie") || recipe.category.include?("Sauce")
        relevant << recipe
        puts "#{index}. #{recipe.title}"
        index += 1
      end
    end
    print_recipe_details(relevant)
  end

  def search_for_sweets
    #include desserts, frosting
    recipe_objects = EasyVegan::Recipe.all
    index = 1
    relevant = []
    recipe_objects.each do |recipe|
      if recipe.category.include?("Dessert") || recipe.category.include?("Frosting")
        relevant << recipe
        puts "#{index}. #{recipe.title}"
        index += 1
      end
    end
    print_recipe_details(relevant)
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
