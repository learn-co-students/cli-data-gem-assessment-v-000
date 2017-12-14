class Dog_search_session # change to DogSearchSession
attr_accessor :selectors, :loaded, :selected_dogs
  def initialize
    @selectors = []
    @loaded = "Not Loaded"
    @selected_dogs = []
  end#initialize
  def self.loaded? #sets status value inside @loaded, yes/no site scrape has been completed
    if Dog.all.size == 0
      @loaded = "Not Loaded Yet"
    elsif Dog.all.size > 0
      @loaded = "Success! #{Dog.all.size} Dogs Loaded"
  end #self.loaded?

  def self.cls
    system("clear")
  end #self.clear

  def self.start
    Dog_search_session.loaded?
    main_screen
  end

  def load_dogs
    url2="http://www.magsr.org/maleadopt.htm"
    url="http://www.magsr.org/femaleadopt.htm"
    Dog.create_from_webpage(url)
    Dog.create_from_webpage(url2)
    #Dog.magsr_fixer
    Dog.save_output
  end

  def main_screen
    Dog_search.cls
    puts "Welcome to Mid-Atlantic German Shepherd Rescue Dog Search Main Menu"
    puts " Please select from the following:"
    puts "1) Load the dogs from MAGSR.org.  Current Status: #{@loaded}"
    puts "2) Begin Dog Search"
    puts "3) Exit"
    puts "4) "
    main_input = user_input(3)
      if main_input == 1
        load_dogs
        main_screen
      elsif main_input == 2
        search_screen
      end

  end #main_screen

  def user_input(num_choices) #works
    input = 0
    while input < 1 || input > num_choices
      puts "Please enter 1 - #{num_choices}"
      input = gets.strip.to_i
    end
    input
  end

  def search_screen
    Dog_search.cls
    puts "Welcome to the Search Menu.  There are #{Dogs.all.size} dogs available, and #{@selected_dogs.size} matches."
    puts
    puts "Please select from the following:"
    puts "1) View Results"
    puts "2) Change Search"
    puts "3) Reset Search"
  end #search_screen



end #Dog_search_session
