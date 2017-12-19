class Slideshower::CLI

def call
  puts "Welcome to Slideshower! Please type the kind of pictures you would like to see. "
  search
  Slideshower::Search.scrape
Slideshower::Search.print
Slideshower::Photos.all
  end #of call

def search
  @search = Slideshower::Search.search
end





end #of class
