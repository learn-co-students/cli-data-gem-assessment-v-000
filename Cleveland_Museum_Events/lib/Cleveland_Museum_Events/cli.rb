class ClevelandMuseumEvents::CLI
  attr_accessor :title, :date, :time, :link
  attr_reader :title, :date, :time, :link


    def initialize
      puts "Welcome to your Cleveland Museum's and Garden's event finder!"
      start
    end


    def start
      puts "Would you like to see the events for the month? (Y/n)"
          date_input = gets.strip.downcase
            if date_input == "y" or "yes"
              museum
            elsif date_input == "n" or "no"
              puts "Goodbye."
            else puts "Please enter a valid command: 'Yes/Y/y' or 'No/N,n'"
            end
    end

    def museum
      puts "What Museum would you like events for? (Art Museum(AM) / Botanical Gardens(BG) / Natural History Museum(NHM) / All)"
          museum = gets.strip.downcase
          if museum == "art museum" || "am"
            ClevelandMuseumEvents::Events.scrape_art
            puts "#{ClevelandMuseumEvents::Events.event}"
            again
          elsif museum == "botanical gardens" || "bg"
            ClevelandMuseumEvents::Events.scrape_botanical
          elsif museum == "natural history museum" || "nhm"
            ClevelandMuseumEvents::Events.scrape_naturalhx
          elsif museum == "all"
            ClevelandMuseumEvents::Events.scrape_all
          else puts "Please enter a valid command: 'Art Museum(AM) / Botanical Gardens(BG)  /Natural History Museum(NHM) / All / Esc (to exit the program)'"
          end
    end


    def again?
      puts "Would you like to search any other museum events?"
        input = gets.strip.downcase
        if input == "yes" || "y"
          museum
        else
          puts "Have a nice day!"
        end
    end

  end
