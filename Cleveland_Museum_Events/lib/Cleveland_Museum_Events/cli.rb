class ClevelandMusuemEvents::CLI
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
      puts "What Museum would you like events for? (Art Museum(AM)/Botanical Gardens(BG)/Natural History Museum(NHM)/All)"
          input = gets.strip.downcase
          if museum == "art museum" || "am"


          elsif museum == "botanical gardens" || "bg"


          elsif museum == "natural history museum" || "nhm"

            
          elsif museum == "all"
            print_events(all)
          else puts "Please enter a valid command: 'Art Museum(AM)/Botanical Gardens(BG)/Natural History Museum(NHM)/All/Esc (to exit the program)'"
          end
    end


    def list_events(Museum)
      puts
    end

  end
