# CLI controller
class CoffeeRoasters::CLI

  def call
    puts "Welcome to The 21 Best Coffee Roasters in the US"
    list_roasters
  end

  def list_roasters
    puts <<~HEREDOC
      1. Blue Bottle
      2. Camber
    HEREDOC
  end
  
end
