class CommandLineInterface
  
  def run 
  end
  
  def display_facts
    colors = [:red, :green, :yellow, :blue, :magenta, :cyan, :white, :red, :green, :yellow, :blue]
    Wikipedia.all.each_with_index{|item, indx|
      puts "#{indx + 1}. #{item}".colorize(color[indx])
    }
  end
end