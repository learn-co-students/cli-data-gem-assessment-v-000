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
        puts "Invalid entry.  Please enter a valid command: 'Yes/Y/y' or 'No/N/n'"
        puts ""
        puts ""
        start
      end
  end

  def museum
    ClevelandMuseumEvents::Events.all.each.with_index(1) do |event, index|
      puts "#{index}. #{event.title}"
    end
    select_event
    again?
  end

  def select_event
    puts ""
    puts ""
    puts "Which event would you like to know more about? (Please choose from the list '1-12')"
    input = gets.strip
    puts ""
    puts ""
    event = ClevelandMuseumEvents::Events.all[input.to_i - 1]
    puts "-----------#{event.title}-----------"
    puts ""
    puts "Description:"
    #event_description(input)
    puts " #{event.description} "
    puts "Weblink:"
    #event_url(input)
    puts " #{event.url} "
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
    puts "Would you like to select a different event? (Y/n)"
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
