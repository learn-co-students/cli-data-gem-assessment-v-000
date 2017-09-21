class TopWebApps::CLI

  def call
    puts "Testing my apps "
    list_web_apps
    web_about
    bye
  end

  def list_web_apps
      @tech_list = TopWebApps::WebApps.web_apps
      @tech_list.each.with_index(1) do |tech, i|
        puts "#{i}. #{tech.name}"
      end
      @tech_list
  end

  def web_about
    input = nil
    puts "--------------------------"
    puts "Enter the number of the tech to get more information"
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0
        tech = @tech_list[input.to_i-1]
        puts "#{tech.image}, #{tech.about}"
        puts "Click here for more information - #{tech.more_information}"
      elsif input == "list"
        list_web_apps
      else
        puts "Please enter a valid entry, list to see the website or exit to exit"
      end
    end
  end

  def bye
    puts "We hope that inspired you :)"
  end

end
