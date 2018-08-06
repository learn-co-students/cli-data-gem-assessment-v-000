class CommandLineInterface
  def self.run
    puts "Welcome to Did-You-Know Wikipedia Edition!"
    puts "To quit the Wikipedia explorer at anytime type 'exit'."
    puts "Please select a topic to be given a random Wikipedia Portal to read:"
    @status = "online"
    generate_topic_list
    start
  end

  def self.start
    while @status == "online"
      get_inputs #starts cli flow
    end
  end

  def self.generate_topic_list
    @list = Scraper.all_topics
  end

  def self.get_inputs
    display_all_topics         #Displays all available main topics
    puts "Select a number to explore that topic"
    get_choice #gets users main topic choice
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


  def self.get_choice
    ask_input = gets.strip
    if ask_input == "exit"
      puts "Goodbye explorer."
      @status = "offline"
    else
      @choice = @list[ask_input.to_i - 1]
      @topic = Topic.find_or_create_by_name(@choice)
    end
  end

  def self.get_rand_url
    @randurl = Scraper.scrape_portals_page(@choice)
    @portal = Portal.find_or_create_by_url(@randurl)
    @selected = Scraper.get_portal_name(@randurl)
    @portal.name = @selected
    @portal.topic = @topic
    @topic.portals << @portal
  end

  def self.visit_portal
    puts "We've selected " + @selected
 + " for you within the " + @choice +" topic you selected."
    puts "Would you like to visit this page? (Y/N)"
    make_choice = gets.strip
    if make_choice == "exit"
      @status = "offline"
      puts "Goodbye explorer."
    else
      if make_choice.upcase == "Y"
        puts @randurl
        Launchy.open(@randurl)
        run
      elsif make_choice.upcase == "N"
        puts "Either type 'reroll' to choose another page within the " + @choice + " topic you selected. Or select a new topic with 'new'."
        choice = gets.strip
        if choice == "reroll"
          get_rand_url
          visit_portal
        elsif choice == "new"
          get_inputs
        end
      end
    end
  end
end


#add exit to cli app
#account for edge case input validations
#add environment file to lib
#remove returns
#create topic instances immediately
#after opening page ask if user wants to continue browsing new pages
