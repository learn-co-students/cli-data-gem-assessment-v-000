class NbaRosters::CLI

  def call
    teams
    list_roster
  end

  def teams
    puts "Enter the number of team you'd like to see the roster of:"
    puts "list of teams"
    input = nil
    while input != "exit"
    input = gets.strip.downcase
      case input
      when "1"
        list_roster
      when "2"
        list_roster
      end
    end
  end

  def list_roster
    puts "list of roster"
  end

end
