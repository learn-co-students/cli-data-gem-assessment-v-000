class DogSearchSession # change to DogSearchSession
attr_accessor :selectors, :loaded, :selected_dogs

  def initialize
    @selectors = []
    @loaded = "Not Loaded"
    @selected_dogs = []
  end#initialize

  def loaded? #sets status value inside @loaded, yes/no site scrape has been completed
    if Dog.all.size == 0
      @loaded = "Not Loaded Yet"
    elsif Dog.all.size > 0
      @loaded = "Success! #{Dog.all.size} Dogs Loaded"
    end
    #binding.pry
  end #self.loaded?

  def self.cls
    system("clear")
  end #self.clear

  def run
    loaded?
    main_screen
  end #self.start

  def load_dogs
    url2="https://www.magsr.org/maleadopt.htm"
    url="https://www.magsr.org/femaleadopt.htm"
    Dog.create_from_webpage(url)
    Dog.create_from_webpage(url2)
    #Dog.magsr_fixer
    Dog.save_output
    loaded?
    main_screen
  end #load_dogs

  def session_exit
    DogSearchSession.cls
    puts "Adopt Today!  Have a nice day."
    exit
  end

  def main_screen
    DogSearchSession.cls
    puts "Welcome to Mid-Atlantic German Shepherd Rescue Dog Search Main Menu"
    puts " Please select from the following:"
    puts "1) Load the dogs from MAGSR.org.  Current Status: #{@loaded}"
    puts "2) Begin Dog Search"
    puts "3) Exit"
    puts "4) View All Dogs"
    #binding.pry
    main_input = user_input(4)
      if main_input == 1
        load_dogs
        main_screen
      elsif main_input == 2
        search_screen
      elsif main_input == 3
        session_exit
      elsif main_input == 4
        all_dogs_display
      end
  end #main_screen

  def all_dogs_display
    DogSearchSession.cls
    Dog.all.each do |dog|
      DogSearchSession.cls
      puts "Name: #{dog.name}"
      puts "Gender: #{dog.gender}"
      puts "Breed: #{dog.breed}"
      puts "Age: #{dog.age}"
      puts "Color: #{dog.color}"
      puts "Size: #{dog.size}"
      puts "Housebroken: #{dog.housebroken}"
      puts "Obedience Trained: #{dog.obedience}"
      puts "Living Situation: #{dog.location}"
      puts "Good with Kids? #{dog.kids}"
      puts "Good with Cats? #{dog.cats}"
      puts "Good with other dogs? #{dog.otherdogs}"
      puts "MAGSR ID#: #{dog.id}"
      puts "Image Link: #{dog.image_url}"
      puts "Description: #{dog.description}"
      puts "Press Any Key To Continue"
      gets.strip

    end
  end

  def user_input(num_choices) #works
    input = 0
    while input < 1 || input > num_choices
      puts "Please enter 1 - #{num_choices}"
      input = gets.strip.to_i
    end
    input
  end #user_input

  def search_screen
    DogSearchSession.cls
    puts "Welcome to the Search Menu.  There are #{Dogs.all.size} dogs available, and #{@selected_dogs.size} matches."
    puts
    puts "Please select from the following:"
    puts "1) View Results"
    puts "2) Change Search"
    puts "3) Reset Search"
  end #search_screen



end #Dog_search_session
