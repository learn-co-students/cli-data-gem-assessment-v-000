class ClevelandMuseumEvents::CLI

def initialize
  puts "Welcome to Cleveland's Museum's and Garden's event finder!"
  puts ""
  start
end


def start
  puts "Would you like to see the next 12 Cleveland Art Museum events? (Y/n)"
  input = gets.strip.downcase
    if input == "y" || input == "yes"
      puts ""
      puts ""
      museum
    elsif input == "n" || input == "no"
      puts ""
      puts ""
      puts "Bye!"
    else
      puts ""
      puts ""
      puts "Please enter a valid command: 'Yes/Y/y' or 'No/N/n'"
    end
end

def museum
  ClevelandMuseumEvents::Events.scrape_art
  ClevelandMuseumEvents::Events.scrape_description
  ClevelandMuseumEvents::Events.scrape_url
  select_event
  #binding.pry
  again?
end

def select_event
  puts ""
  puts ""
  puts "Which event would you like to know more about? (Please choose from the list '1-12')"
  input = gets.strip
  puts ""
  puts ""
  @events = ClevelandMuseumEvents::Events.events[input.to_i - 1]
  puts "-----------#{@events}-----------"
  puts ""
  puts "Description:"
  event_description(input)
  puts "Weblink:"
  event_url(input)
  puts "---------------------------------------------------------"
  puts ""
  puts ""

end

def event_description(input)
  puts " #{ClevelandMuseumEvents::Events.description[input.to_i - 1]} "
  puts ""
end

def event_url(input)
  puts " #{"www.clevelandart.org" + ClevelandMuseumEvents::Events.url[input.to_i - 1]} "
  puts ""
  puts ""
end

def again?
  puts "Would you like to select a different event?"
    input = gets.strip.downcase
    if input == "yes" || input == "y"
      puts ""
      puts ""
      museum
    elsif input == "no" || input == "n"
      puts ""
      puts ""
      puts "Bye!"
      puts ""
    else
      invalid_entry
    end
end

def invalid_entry
  puts "Please enter a valid entry (Y/n)"
  again?
end

end


#Saving these for potential growth of program later to include botanical gardens and natural hx museum
#def museum
  #puts "What Museum would you like events for? (Art Museum(AM) / Botanical Gardens(BG) / Natural History Museum(NHM) / All / Esc (to exit the program)"
#      puts ""
      #museum = gets.strip.downcase
      #if museum == "art museum" || museum == "am"
          #elsif museum == "botanical gardens" || museum == "bg"
          #  ClevelandMuseumEvents::Events.scrape_botanical
          #  puts "#{ClevelandMuseumEvents::Events.event}"
          #  again?
          #elsif museum == "natural history museum" || museum == "nhm"
          #  ClevelandMuseumEvents::Events.scrape_naturalhx
          #  puts "#{ClevelandMuseumEvents::Events.event}"
          #  again?
          #elsif museum == "all"
          #  ClevelandMuseumEvents::Events.scrape_all
          #  puts "#{ClevelandMuseumEvents::Events.event}"
          #  again?
          #elsif museum == "esc"
          #  puts ""
          #  puts ""
          #  puts "Goodbye!"
          #else puts "Please enter a valid command. "
          #  puts ""
          #  puts ""
          #  invalid_entry
          #end
        #end
