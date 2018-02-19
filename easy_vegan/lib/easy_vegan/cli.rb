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
      #convert integer input and assign it to the correct category.
      convert_input_to_category(input)
      #EasyVegan::Scraper.scrape_recipe_page(url)

      #create all recipe objects
      make_recipe_objects
      #EasyVegan::Recipe.create_from_collection(EasyVegan::Scraper.scrape_index_page)

      #collect urls, send every url to be scraped. read_each_recipe_page automates the scraping of all individual recipe pages and adds all recipe attributes to recipe objects
      add_attributes_to_recipes
      #EasyVegan::Scraper.read_each_recipe_page

      #search by category (cli.search_by_category)
      search_by_category(input)

      #print by category (cli. print_recipe_titles)

      print_recipe_titles(input)

    elsif input == "exit"
      goodbye
    end
  end

  def convert_input_to_category(input)
    categories = EasyVegan::Scraper.scrape_categories
    input = input - 1
    categories[input]
  end

  def search_by_category(input)
    category_wanted = convert_input_to_category(input)
    #binding.pry
    recipe_objects = EasyVegan::Recipe.all
      recipe_objects.collect do |recipe|
        recipe[:category].include?("#{category_wanted}")
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
      #binding.pry
      if @recipe_titles[:category].includes?(input)
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

  def add_attributes_to_recipes
    EasyVegan::Recipe.all.each do |recipe|
      attributes = EasyVegan::Scraper.read_each_recipe_page
      recipe.add_recipe_attributes(attributes)
    end
  end

end
