require_relative "../lib/facts.rb"
require_relative "../lib/topic.rb"
require "colorize"

class CommandLineInterface
  # def initialize
  #   run
  # end
  def self.run
    puts "Welcome to Did-You-Know Wikipedia Edition!"
    puts "Please select a topic to learn some cool random facts:"
    display_all_topics
    puts "Select a number to explore facts from that topic"
    @choice = gets.strip
    find_choice
    #binding.pry
  end

  def self.display_all_topics
    colors = [:red, :green, :yellow, :blue, :magenta, :cyan, :red, :green, :yellow, :blue, :magenta]
    @list = []
    Topic.all_topics_list.each_with_index{|item, indx|
      @list << item
      puts "#{indx + 1}. #{item}".colorize(colors[indx])
    }
  end

  def self.find_choice
    picked = @list[@choice.to_i - 1]
    selected = Topic.find_or_create_by_name(@choice)
    #binding.pry
    puts "You selected #{picked}"
    puts "#{selected}"
    puts "#{Topic.all}"
  end

  def find_or_create_by_name(name)
    #binding.pry
    if Topic.all.detect{|item| item.name == name}
      @topic = Topic.all.detect{|item| item.name == name}
    else
      @topic = Topic.new(name)
    end
    @topic.add_portal
  end


  # def get_random_fact
  #   lookforkey = @all_choices[@choice.to_i - 1].to_sym
  #   binding.pry
  #   puts DidYouKnow.facts[lookforkey].sample
  #   the DidYouKnow.facts is only returning the last item in the facts hash
  #   binding.pry
  #   puts Facts.random[@choice.to_i - 1].values.sample
  # end
end
