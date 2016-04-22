#Our CLI controller
class BoxOffice::CLI

  def call
    list_gross
    menu
    goodbye
  end

  def list_gross
    @grosses = BoxOffice::Gross.today
    @grosses.each.with_index(1) do |gross, i|
      puts "#{i}. #{gross.name} - #{gross.boxoffice}"
    end
  end

  def menu
    input = nil
    while input != 'exit'
      puts "Enter number of movie you'd like more info on or type 'list' or 'exit':"
      input = gets.strip.downcase
      if input.to_i > 0
        the_gross = @grosses[input.to_i-1]
        puts "#{i}. #{the_gross.name} - #{the_gross.boxoffice}"
      elsif input == 'list'
        list_gross
      # case input
      # when "1"
      #   puts "More info on movie 1..."
      # when "2"
      #   puts "More info on deal 2..."
      # when "list"
      #   list_gross
      else 
        puts "Not sure what you want, type list or exit"
      end
    end
  end

  def goodbye
    puts "Come back for more movie info tomorrow!"
  end
end