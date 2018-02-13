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
    puts "Please select a topic to learn some cool facts:"
    display_all_facts
    puts "Select a number to explore facts from that topic"
    choice = input.gets
  end
  
  def display_all_facts
    colors = [:red, :green, :yellow, :blue, :magenta, :cyan, :white, :red, :green, :yellow, :blue]
    #binding.pry
    DidYouKnow.all_topics.each_with_index{|item, indx|
      puts "#{indx + 1}. #{item}".colorize(colors[indx])
    }
  end
end