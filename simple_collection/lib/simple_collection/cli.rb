#CLI Controller
class SimpleCollection_CLI

  def call
    welcome
    goodbye
  end

  def welcome
    puts "Welcome Knitter! What would you like to make today?"
    puts ""
  end

  def goodbye
    puts "Happy Knitting!"
  end
    

end
