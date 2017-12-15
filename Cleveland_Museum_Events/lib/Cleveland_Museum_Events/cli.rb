class ClevelandMuseumEvents::CLI

    def initialize
      puts "Welcome to Cleveland's Museum's and Garden's event finder!"
      puts ""
      start
    end


    def start
      puts "Would you like to see today's Museum or Garden events? (Y/n)"
          input = gets.strip.downcase
            if input == "y" || input == "yes"
              puts ""
              puts ""
              museum
            elsif input == "n" || input == "no"
              puts ""
              puts ""
              puts "Goodbye!"
            else
              puts ""
              puts ""
              puts "Please enter a valid command: 'Yes/Y/y' or 'No/N/n'"
            end
    end

    def museum
      puts "What Museum would you like events for? (Art Museum(AM) / Botanical Gardens(BG) / Natural History Museum(NHM) / All / Esc (to exit the program)"
      puts ""
          museum = gets.strip.downcase
          if museum == "art museum" || museum == "am"
            ClevelandMuseumEvents::Events.scrape_art
            puts "#{ClevelandMuseumEvents::Events.event}"
            again?
          elsif museum == "botanical gardens" || museum == "bg"
            ClevelandMuseumEvents::Events.scrape_botanical
            puts "#{ClevelandMuseumEvents::Events.event}"
            again?
          elsif museum == "natural history museum" || museum == "nhm"
            ClevelandMuseumEvents::Events.scrape_naturalhx
            puts "#{ClevelandMuseumEvents::Events.event}"
            again?
          elsif museum == "all"
            ClevelandMuseumEvents::Events.scrape_all
            puts "#{ClevelandMuseumEvents::Events.event}"
            again?
          elsif museum == "esc"
            puts ""
            puts ""
            puts "Goodbye!"
          else puts "Please enter a valid command. "
            puts ""
            puts ""
            invalid_entry
          end
    end


    def again?
      puts "Would you like to search any other museum events?"
        input = gets.strip.downcase
        if input == "yes" || input == "y"
          puts ""
          puts ""
          museum
        else
          puts ""
          puts ""
          puts "Goodbye!"
          puts ""
        end
    end

    def invalid_entry
      museum
    end

  end
