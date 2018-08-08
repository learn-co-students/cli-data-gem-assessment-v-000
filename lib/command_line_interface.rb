class CommandLineInterface
  def self.run
    puts "Welcome to Did-You-Know Wikipedia Edition!"
    puts "To quit the Wikipedia explorer at anytime type 'exit'."
    @status = "online"
    generate_topic_list
    start
  end

  def self.start
    puts "Please select a topic to be given a random Wikipedia Portal to read:"
    while @status == "online"
      get_inputs #starts cli flow
    end
  end

  def self.get_current_input
    @current_input = gets.strip.upcase
  end

  def self.quit?(option)
    if option == "EXIT"
      @status = "offline"
      puts "Goodbye explorer."
    else
      false
    end
  end

  def self.generate_topic_list
    @list = Scraper.all_topics
  end

  def self.get_rand_url
    # binding.pry
    @randurl = Scraper.scrape_portals_page(@topic.name)
    @portal = Portal.find_or_create_by_url(@randurl)
    @selected = Scraper.get_portal_name(@randurl)
    @portal.name = @selected
    @portal.topic = @topic
    @topic.portals << @portal
  end

  def self.get_inputs
    display_all_topics         #Displays all available main topics
    get_topic_choice #gets users main topic choice
    get_rand_url #gets random sub-topic and creates Portal objects
    visit_portal #asks user if they want to visit the randomnly select sub-topic
  end

  #beautifies and lists the command line options
  def self.display_all_topics
    colors = [:red, :green, :yellow, :blue, :magenta, :cyan, :red, :green, :yellow, :blue, :magenta]
    @list.each_with_index{|item,indx|
      puts "#{indx + 1}. #{item}".colorize(colors[indx])
    }
  end


  def self.get_topic_choice
    puts "Select a number (1-12) to explore that topic"
    get_current_input
    # binding.pry
    if !quit?(@current_input)
      while !@current_input.to_i.between?(1,12)#ask_input != "1"
        # self.send(__callee__)
        puts "Invalid input. Please choose a number between 1 and 12."
        get_topic_choice
      end
      @choice = @list[@current_input.to_i - 1]
      @topic = Topic.find_or_create_by_name(@choice)
      # binding.pry
    else
      quit?(@current_input)
    end
  end

  def self.visit_portal
    puts "We've selected " + @selected
 + " for you within the " + @choice +" topic you selected."
    puts "Would you like to visit this page? (Y/N)"
    visit_page?
  end

  def self.visit_page?
    #checks if user wants to visit the selected portal page
    get_current_input
    if !quit?(@current_input)
      case @current_input
      when "Y"
        puts @randurl
        Launchy.open(@randurl)
        puts "Do you want to continue exploring? (Y/N)"
        keep_exploring?
      when "N"
        explore_more
      end
    end
  end

  def self.keep_exploring?
    get_current_input
    if @current_input == "Y"
      start
    elsif @current_input == "N"
      quit?("EXIT")
    else
      puts "Please enter a valid command (Y/N) to keep exploring."
      keep_exploring?
    end
  end

  def self.explore_more
    puts "Either type 'reroll' to choose another page within the " + @choice + " topic you selected. Or select a new topic with 'new'."
    get_current_input
    if !quit?(@current_input)
      if @current_input == "REROLL"
        get_rand_url
        visit_portal
      elsif @current_input == "NEW"
        get_inputs
      else
        puts "Invalid input please enter (reroll/new)."
        explore_more
      end
    end
  end
end
