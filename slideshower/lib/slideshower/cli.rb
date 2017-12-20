class Slideshower::CLI

def call
    search
  Slideshower::Search.scrape

Slideshower::Photos.all
  end #of call

def search
  @search = Slideshower::Search.search
end





end #of class
