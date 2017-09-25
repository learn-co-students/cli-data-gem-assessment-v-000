class TopWebApps::CLI

  def call
    list_web_apps
    menu
    bye
  end

  def list_web_apps
      @tech_list = TopWebApps::WebApps.web_apps
      @tech_list.each.with_index(1) do |tech, i|
        puts "#{i}. #{tech.name}".upcase
      end
      @tech_list
  end

  def menu
    input = nil
    puts "--------------------------"
    puts "Enter the number of the tech to get more information"
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0
        tech = @tech_list[input.to_i-1]
        puts ""
        puts "Image:".upcase
        puts "-#{tech.image}"
        puts ""
        puts "About".upcase
        puts "-#{tech.about}"
        puts ""
        puts "Click here for more information:".upcase
        puts "-#{tech.more_information}"
        puts ""
      elsif input == "list"
        list_web_apps
      else
        puts "Please enter a valid entry, 'list' to see the list of websites or 'exit' to exit"
      end
    end
  end

  def bye
    puts "We hope that inspired you :)"
  end

end
