class ClevelandMuseumEvents::CLI

  def initialize
      ClevelandMuseumEvents::Scrapers.scrape_art
    puts "Welcome to Cleveland's Museum's and Garden's event finder!"
    puts ""
    start
  end

  def start
    puts "Would you like to see the next 12 Cleveland Art Museum events? (Y/n)"
    input = gets.strip.downcase
      if input == "y" || input == "yes"
        dbl_spacing
        museum
      elsif input == "n" || input == "no"
        dbl_spacing
        puts "Au revoir!".upcase
      else
        dbl_spacing
        puts "Invalid entry.  Please enter a valid command: 'Yes/Y/y' or 'No/N/n'"
        dbl_spacing
        start
      end
  end

  def museum
    puts "---------------------------------------------------------"
    puts ""
    ClevelandMuseumEvents::Events.all.each.with_index(1) do |event, index|
      puts "#{index}. #{event.title}"
      puts ""
    end
    puts "---------------------------------------------------------"
    select_event
    # more?
    again?
  end

  def select_event
    dbl_spacing
    puts "Which event would you like to explore? (Please choose from the list '1-12')"
    input = gets.strip
    dbl_spacing
    event = ClevelandMuseumEvents::Events.all[input.to_i - 1]
    puts "-----------#{event.title}-----------"
    puts ""
    puts "Description: #{event.description}"
    #event_description(input)
    puts ""
    puts "Weblink:  #{event.url}"
    #event_url(input)
    puts ""
    puts "---------------------------------------------------------"
    dbl_spacing
  end

  def open_in_browser
    events.open_in_browser
  end

  def event_description(input)
    puts " #{ClevelandMuseumEvents::Events.description[input.to_i - 1]} "
    puts ""
  end

  def event_url(input)
    puts " #{"www.clevelandart.org" + ClevelandMuseumEvents::Events.url[input.to_i - 1]} "
    dbl_spacing
  end

# def more?
#   puts "Would you like to know more about this event? (Y/n)"
#   more = gets.strip.downcase
#   if more == "yes" || more == "y"
#     dbl_spacing
#     open_in_browser
#   elsif more == "no" || more == "n"
#     dbl_spacing
#     again?
#   else
#     invalid_entry_more?
#   end
# end

  def again?
    puts "Would you like to select a different event? (Y/n)"
    input = gets.strip.downcase
    if input == "yes" || input == "y"
      dbl_spacing
      museum
    elsif input == "no" || input == "n"
      dbl_spacing
      puts "Au revoir!".upcase
      puts ""
    else
      invalid_entry_again?
    end
  end

  def invalid_entry
    puts "Please enter a valid entry (Y/n)"
    dbl_spacing
  end

  # def invalid_entry_more?
  #   dbl_spacing
  #   invalid_entry
  #   more?
  # end

  def invalid_entry_again?
    dbl_spacing
    invalid_entry
    again?
  end

  def dbl_spacing
    puts ""
    puts ""
  end

end
