class ClevelandMuseumEvents::CLI

def initialize
  puts "Welcome to your Cleveland Museum's and Garden's event finder!"
  start
end

def start
  puts "Would you like to see the events at Cleveland's Museums and Botanical Gardens? (Y/n)"
  input = gets.strip.downcase
  if input == "y"
  command
end

def command
  puts "Would you like to see the events for the month? (Y/n)"
      date_input = gets.strip.downcase
        if date_input == "y" or "yes"

        elsif date_input == "n" or "no"


        else puts "Please enter a valid command: 'Yes/Y/y' or 'No/N,n'""
        end
end
