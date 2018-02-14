require_relative "../lib/facts.rb"
require_relative "../lib/topic.rb"
require "colorize"

class CommandLineInterface
  def initialize
    run
  end
  def run
    puts "Welcome to Did-You-Know Wikipedia Edition!"
    puts "Please select a topic to learn some cool random facts:"
    display_all_topics
    puts "Select a number to explore facts from that topic"
    choice = gets.strip
    #create new topic object
    #which creates a portal object that belongs_to Topic and returns a random portal
    #the Portal class the sends the random portal object to the DidYouKnow class
    #the DidYouKnow class scrapes the seleted portal object
    Topic.new(choice)
    get_random_fact
  end
  
  def display_all_topics
    colors = [:red, :green, :yellow, :blue, :magenta, :cyan, :red, :green, :yellow, :blue, :magenta]
    #binding.pry
    @all_choices = []
    Topic.all.each_with_index{|item, indx|
      puts "#{indx + 1}. #{item}".colorize(colors[indx])
      lis_item = "#{item}"
      @all_choices << lis_item
    }
  end
  
  def get_random_fact
    #lookforkey = @all_choices[@choice.to_i - 1].to_sym
    #binding.pry
    #puts DidYouKnow.facts[lookforkey].sample
    #the DidYouKnow.facts is only returning the last item in the facts hash
    #binding.pry
    puts Facts.random[@choice.to_i - 1].values.sample
  end
end