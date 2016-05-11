#Our CLI controller
class BoxOffice::CLI

  def call
    list_gross
    menu
    goodbye
  end

  def list_gross
    @grosses = BoxOffice::Gross.today
    # binding.pry
    @grosses.each.with_index(1) do |title, i|
      puts "#{i}. #{title}"
    end
  end

  def menu
    input = nil
    while input != 'exit'
      puts "Enter number of movie you'd like more info on or type 'list' or 'exit':"
      input = gets.strip.downcase
      if input.to_i > 0
        case input
        when "1"
          puts "More info on movie 1..."
          @gross = BoxOffice::Gross.scrape_grosses_1
          puts "#{@gross}"
        when "2"
          puts "More info on movie 2..."
          @gross = BoxOffice::Gross.scrape_grosses_2
          puts "#{@gross}"
        when "3"
          puts "More info on movie 3..."
        when "4"
          puts "More info on movie 4..."
        when "5"
          puts "More info on movie 5..."
        end
        # the_gross = @grosses[input.to_i-1]
        # @grosses.each do |title|
        #   puts " #{title}".
      
       

         #{grosses.name} - #{the_gross.boxoffice}"
      elsif input == 'list'
        list_gross
     
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