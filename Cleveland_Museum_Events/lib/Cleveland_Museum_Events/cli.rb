class ClevelandMuseumEvents::CLI

def initialize
  puts "Welcome to your Cleveland Museum's and Garden's event finder!"
  start
end

def start
  puts "Would you like to see the events at Cleveland's Museums and Botanical Gardens? (Y/n)"
  input = gets.strip.downcase
  if input == "y"
    puts "Would you like to see the events for the day? week? or month? (day/week/month)"
        date_input = gets.strip.downcase
          if date_input == "day"

          elsif date_input == "week"

          elsif date_input == "month"

          else puts "Please enter a valid command: 'day', 'week' or 'month'"
          end
end
