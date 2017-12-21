require_relative './photo.rb'
class Slideshower::CLI

def call
  search
  scrape
  menu
end #of call

def search
<<<<<<< HEAD
  puts "Welcome to Slideshower! Please type the kind of stock photos you would like to see. "
=======
  puts "Welcome to Slideshower! Please type the kind of pictures you would like to see. "
>>>>>>> 34143a7b33fb4dede501889a00f1784350c75711
  puts "Pictures of:"
  @search = Slideshower::Search.search
end

def scrape
Slideshower::Search.scrape
end

def menu
  input = nil
  while input != "exit"
<<<<<<< HEAD
  puts "Press 1 to view the stock photos in a slideshow."
  puts "Press 2 to view all of the stock photos in a list"
  puts "Press 3 to choose a new stock photo subject."
=======
  puts "Press 1 to view the photos in a slideshow."
  puts "Press 2 to view all of the photos in a list"
  puts "Press 3 to choose a new photo subject."
>>>>>>> 34143a7b33fb4dede501889a00f1784350c75711
  puts "Type 'exit' to exit the program."
  input = gets.strip

    if input.to_i == 1
      Slideshower::Photos.slideshow
    elsif input.to_i == 2
      Slideshower::Photos.list
    elsif input.to_i == 3
      search
    elsif input == "exit"
      goodbye
    end
  end
end

def goodbye
  puts "Have a nice day!"
end

end #of class
