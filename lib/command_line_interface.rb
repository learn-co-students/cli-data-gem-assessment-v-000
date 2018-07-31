require_relative "../lib/topic.rb"
require "colorize"
require "launchy"

class CommandLineInterface
  def self.run
    puts "Welcome to Did-You-Know Wikipedia Edition!"
    puts "Please select a topic to be given a random Wikipedia Portal to read:"

    #Displays all available main topics
    display_all_topics
    puts "Select a number to explore that topic"
    @choice = @list[gets.strip.to_i]

    #finds or creates an Topic instance
    @topic = Topic.find_or_create_by_name(@choice)
    @randurl = Scraper.scrape_portals_page(@choice)

    @portal = Portal.find_or_create_by_url(@randurl)
    @portal.topic = @topic
    @topic.portals << @portal

    puts @randurl
    Launchy.open(@randurl)
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
end
