#our CLI Controller
require_relative "./recipe.rb"
require_relative "./scraper.rb"
require 'pry'
class EasyVegan::CLI

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
    input = ""
    puts "Which category of recipes would you like to explore? You may type a category to explore, or type exit"
    input = gets.strip
    if input.to_i > 0 && input.to_i <= EasyVegan::Scraper.scrape_categories.size
        input = input.to_i

      #EasyVegan::Scraper.scrape_recipe_page(url)
      #binding.pry
      #create all recipe objects
      make_recipe_objects
      #EasyVegan::Recipe.create_from_collection(EasyVegan::Scraper.scrape_index_page)

      #collect urls, send every url to be scraped. read_each_recipe_page automates the scraping of all individual recipe pages and adds all recipe attributes to recipe objects
      add_attributes_to_recipes
      #EasyVegan::Scraper.read_each_recipe_page

      #convert integer input and assign it to the correct category.

      #search by category (cli.search_by_category)
      search_and_print_by_category(input)

    elsif input == "exit"
      goodbye
    end
  end

  def convert_input_to_category(input)
    case input
      when "1"
        @cat = print_all
      when "2"
        @cat = "Dessert"
      when "3"
        @cat = "Entrée"
      when "4"
        @cat = "Breakfast"
      when "5"
        @cat = "Snack"
      when "6"
        @cat = "Side"
      when "7"
        @cat = "Beverage"
      when "8"
        @cat = "GFF??"
      when "9"
        @cat ="Vegan"
      when "10"
        @cat ="Helpful How-to"
      end
      @cat
  end

  def search_and_print_by_category(input)
    category_wanted = convert_input_to_category
    recipe_objects = EasyVegan::Recipe.all
    binding.pry
    recipe_objects.each_with_index do |recipe, index|
      if recipe.category.include?("#{category_wanted}")
        #binding.pry
        puts "#{index+1}. #{recipe.title}"
      end
    end
  end

  def print_categories
    recipe_objects = EasyVegan::Recipe.all
    recipe_objects.each_with_index do |recipe, index|
      puts "#{index+1}. #{recipe.category}"
    end
  end


  def goodbye
    puts "Come back soon for more vegan recipes!"
  end

#we need to refactor print such that it only prints recipes with category = input
#the recipe objects will not have a category attribute until add_attributes is run successfully. we need to carefully choose order of menu and call


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

  def make_recipe_objects
    recipe_objects = EasyVegan::Scraper.scrape_index_page
    EasyVegan::Recipe.create_from_collection(recipe_objects)

  end

  # def add_attributes_to_recipes
  #   attributes = EasyVegan::Scraper.read_each_recipe_page
  #   #binding.pry
  #   EasyVegan::Recipe.all.each do |recipe|
  #     recipe.add_recipe_attributes(attributes)
  #     binding.pry
  #     #binding.pry
  #   end
  # end


#we need to only add the attributes of one recipe at time. at this point, attirbutes is holding everything

  def add_attributes_to_recipes
    EasyVegan::Recipe.all.each do |recipe|
      recipe.add_recipe_attributes(EasyVegan::Scraper.scrape_recipe_page(recipe.url))
      #binding.pry
    end
  end

end
