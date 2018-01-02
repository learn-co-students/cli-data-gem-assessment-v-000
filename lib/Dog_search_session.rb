class DogSearchSession # change to DogSearchSession
attr_accessor :selectors, :loaded, :selected

  def initialize
    @selectors = []
    @selected = []
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

  def display_dog(dog)
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
  end #display_dog

  def all_dogs_display
    DogSearchSession.cls
    index = 1
      while index >= 1 && index <= Dog.all.size - 1
        DogSearchSession.cls
        display_dog(Dog.all[index])
        puts "1) Previous"
        puts "2) Next"
        puts "3) Exit"
        main_input = user_input(3)
          if main_input == 1
            index = index - 1
          elsif main_input == 2
            index +=1
          elsif main_input == 3
            index = 0
          end
      end
    main_screen
  end #all_dogs_display

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
    puts "Welcome to the Search Menu.  There are #{Dog.all.size} dogs available, and #{@selected.size} matches."
    puts
    puts "Please select from the following:"
    puts "1) View Results"
    puts "2) Change Search"
    puts "3) Reset Search"
    main_input = user_input(9)
      if main_input == 1
      elsif main_input == 2
        select_screen
      elsif main_input == 3
      end
  end #search_screen

  def select_screen
    DogSearchSession.cls
    puts "Search Select Menu: #{@selected.size} matches."
    puts "Narrow your search by:"
    puts "1) Gender"
    puts "2) Breed"
    puts "3) Age"
    puts "4) Housebroken"
    puts "5) Good with Children?"
    puts "6) Good with other Dogs?"
    puts "7) Goot with Cats?"
    puts "8) "
    main_input = user_input(8)
      if main_input == 1
        gender_select
      elsif main_input == 2
        breed_select
      end
  end #select_screen

  def gender_select
    puts "Gender Select Menu:"
    puts "1) Male"
    puts "2) Female"
    puts "3) Both"
    puts "4) Return to Search Select Menu"
    main_input = user_input(4)
      if main_input == 1
      end
  end

end #Dog_search_session2
