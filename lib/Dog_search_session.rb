class Dog_search_session
attr_accessor :selectors, :loaded, :selected_dogs
  def initialize
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

  def main_screen
    Dog_search.cls
    puts "Welcome to Mid-Atlantic German Shepherd Rescue Dog Search Main Menu"
    puts " Please select from the following:"
    puts "1) Load the dogs from MAGSR.org.  Current Status: #{@loaded}"
    puts "2) Begin Dog Search"
    puts "3) "
    puts "4) "
    puts ""
  end #main_screen

  def search_screen
    Dog_search.cls
    puts "Welcome to the Search Menu.  There are #{Dogs.all.size} dogs available, and #{@selected_dogs.size} matches."
    puts
    puts "Please select from the following:"
    puts "1) View Results"
    puts "2) Change Search"
    puts "3) Reset Search"
  end search_screen


end #Dog_search_session
