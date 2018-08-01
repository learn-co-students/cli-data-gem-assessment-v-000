require_relative "../lib/topic.rb"
require "colorize"
require "launchy"

class CommandLineInterface
  def self.run
    puts "Welcome to Did-You-Know Wikipedia Edition!"
    puts "Please select a topic to be given a random Wikipedia Portal to read:"
    get_inputs

  end

  def self.get_inputs

    #Displays all available main topics
    display_all_topics
    puts "Select a number to explore that topic"
    get_choice
    get_rand_url
    #finds or creates an Topic instance


    visit_portal
  end

  #beautifies and lists the command line options
  def self.display_all_topics
    colors = [:red, :green, :yellow, :blue, :magenta, :cyan, :red, :green, :yellow, :blue, :magenta]
    @list = []
    Topic.all_topics_list.each_with_index{|item, indx|
      @list << item
      puts "#{indx + 1}. #{item}".colorize(colors[indx])
    }
  end

  def self.get_choice
    @choice = @list[gets.strip.to_i - 1]
    @topic = Topic.find_or_create_by_name(@choice)
  end

  def self.get_rand_url
    @randurl = Scraper.scrape_portals_page(@choice)
    @portal = Portal.find_or_create_by_url(@randurl)
    @portal.name = Scraper.get_portal_name(@randurl)
    @portal.topic = @topic
    @topic.portals << @portal
  end

  def self.visit_portal
    puts "We've selected " + Scraper.get_portal_name(@randurl)
 + " for you within the " + @choice +" topic you selected."
    puts "Would you like to visit this page? (Y/N)"
    if gets.strip.upcase == "Y"
      puts @randurl
      Launchy.open(@randurl)
    else
      puts "Either type 'reroll' to choose another page within the " + @choice + " topic you selected. Or select a new topic with 'new'."
      choice = gets.strip
      if choice == "reroll"
        get_rand_url
        binding.pry
        visit_portal
      elsif choice == "new"
        get_inputs
      end
    end
  end
end
