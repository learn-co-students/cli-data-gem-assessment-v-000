
class Slideshower::CLI

def call
  search
  scrape
  menu
end #of call

def search
  puts "Welcome to Slideshower! Please type the kind of stock photos you would like to see. "
puts
  puts "Pictures of:"
  @search = Slideshower::Search.search
end #of search

def scrape
Slideshower::Search.scrape
end #of scrape

def menu
  input = nil
  while input != "exit"

  puts
  puts "Press 1 to view the #{Slideshower::Search.subject}photos in a slideshow."
  puts "Press 2 to view all of the #{Slideshower::Search.subject}photos in a list."
  puts "Press 3 to choose a new category of photos."
  puts
  puts "Type 'exit' to exit the program."
  input = gets.strip

    if input.to_i == 1
      Slideshower::Photos.slideshow
    elsif input.to_i == 2
      Slideshower::Photos.list
    elsif input.to_i == 3
      Photo::reset_all
      call.new
    elsif input == "exit"
      goodbye
    end
  end
end #of menu

def goodbye
  puts
  puts "Have a nice day!"
  exit
end #of goodbye

end #of class
