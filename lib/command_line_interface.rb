#require_relative "../lib/scraper.rb"
require_relative "../lib/did_you_know.rb"
#require "wikipedia_module"
require "colorize"
class CommandLineInterface
  def initialize
    run
  end
  def run
    puts "Welcome to Did-You-Know Wikipedia Edition!"
    puts "Please select a topic to learn some cool random facts:"
    display_all_facts
    puts "Select a number to explore facts from that topic"
    @choice = gets.strip
    get_random_fact
  end
  
  def display_all_facts
    colors = [:red, :green, :yellow, :blue, :magenta, :cyan, :red, :green, :yellow, :blue, :magenta]
    @all_choices = []
    #binding.pry
    DidYouKnow.all.each_with_index{|item, indx|
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
    puts DidYouKnow.facts[@choice.to_i - 1].values.sample
  end
end