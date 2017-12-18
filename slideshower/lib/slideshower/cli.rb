class Slideshower::CLI

def call
  puts "Welcome to Slideshower! Please type the kind of pictures you would like to see. "
  search
  Slideshower::Search.scrape
  end #of call

def search
  @search = Slideshower::Search.search
end





end #of class
