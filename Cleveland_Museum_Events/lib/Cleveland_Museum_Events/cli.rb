class ClevelandMuseumEvents::CLI

  def initialize
    ClevelandMuseumEvents::Scrapers.scrape_art
    dbl_spacing
    puts " ------------------------------------------------------------------"
    puts "|                                                                  |"
    puts "|   Welcome to Cleveland's Museum's and Garden's event finder!!!   |"
    puts "|                                                                  |"
    puts " ------------------------------------------------------------------"
    dbl_spacing
    start
  end

  def start
    puts "Would you like to see today's Cleveland Art Museum events? (Y/n)"
    input = gets.strip.downcase
      if input == "y" || input == "yes"
        dbl_spacing
        museum_events
      elsif input == "n" || input == "no"
        puts "".upcase
        goodbye
        dbl_spacing
      else
        dbl_spacing
        puts "Invalid entry.  Please enter a valid command: 'Yes/Y/y' or 'No/N/n'"
        dbl_spacing
        start
      end
  end

  def museum_events
    museum_events_display
    select_event
    # more?
    again?
  end

  def select_event
    dbl_spacing
    puts "Which event would you like to explore? (Please choose from the list '1-15')"
    input = gets.strip
    dbl_spacing
    if input.to_i.between?(1,15)
      event_display(input)
    else
      invalid_entry_select_event
    end
  end

  def museum_events_display
    puts "---------------------------------------------------------"
    puts ""
    ClevelandMuseumEvents::Events.all.each.with_index(1) do |event, index|
      puts "#{index}. #{event.title}"
      puts ""
    end
    puts "---------------------------------------------------------"
  end

  def event_display(input)
    @event = ClevelandMuseumEvents::Events.all[input.to_i - 1]
    puts "-----------#{@event.title}-----------"
    puts ""
    puts "Description: #{@event.description}"
    #event_description(input)
    puts ""
    puts "Weblink:  #{@event.url}"
    #event_url(input)
    puts ""
    add_event_bottom_border
    dbl_spacing
  end

  def event_description(input)
    puts " #{ClevelandMuseumEvents::Events.description[input.to_i - 1]} "
    puts ""
  end

  def event_url(input)
    puts " #{"www.clevelandart.org" + ClevelandMuseumEvents::Events.url[input.to_i - 1]} "
    dbl_spacing
  end

  def again?
    puts "Would you like to select a different event? (Y/n)"
    input = gets.strip.downcase
    if input == "yes" || input == "y"
      dbl_spacing
      museum_events
    elsif input == "no" || input == "n"
      goodbye
      dbl_spacing
    else
      invalid_entry_again?
    end
  end

  def invalid_entry
    puts "Please enter a valid entry (Y/n)"
    dbl_spacing
  end

  def invalid_entry_select_event
    dbl_spacing
    puts "Please enter a number 1-15"
    select_event
  end

  def invalid_entry_again?
    dbl_spacing
    invalid_entry
    again?
  end

  def dbl_spacing
    puts ""
    puts ""
  end

  def add_event_bottom_border
    border = "-----------#{@event.title}-----------".length
    puts "-"* border
  end

  def goodbye
    puts "                   ---------------------------------                  "
    puts "                  |                                 |                 "
    puts "                  |          Au revoir!!!!          |                 "
    puts "                  |                                 |                 "
    puts "                   ---------------------------------                  "
  end
end


# Adding more details to the returned event information...
# def more?
#   puts "Would you like to know more about this event? (Y/n)"
#   more = gets.strip.downcase
#   if more == "yes" || more == "y"
#     dbl_spacing
#
#   elsif more == "no" || more == "n"
#     dbl_spacing
#     again?
#   else
#     invalid_entry_more?
#   end
# end

  # def invalid_entry_more?
  #   dbl_spacing
  #   invalid_entry
  #   more?
  # end
