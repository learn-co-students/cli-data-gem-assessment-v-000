class BoxOffice::CLI

  def call
    list_gross
    menu
    goodbye
  end

  def list_gross
    @titles = BoxOffice::Gross.get_movie_titles
    # binding.pry
    @titles.each.with_index(1) do |title, i|
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
          puts "Made a whopping #{@gross} over the weekend!"
        when "2"
          puts "More info on movie 2..."
          @gross = BoxOffice::Gross.scrape_grosses_2
          puts "Rang up an impressive #{@gross} over the weekend!"
        when "3"
          puts "More info on movie 3..."
          @gross = BoxOffice::Gross.scrape_grosses_3
          puts "Cashing in to the tune of #{@gross} this weekend."
        when "4"
          puts "More info on movie 4..."
          @gross = BoxOffice::Gross.scrape_grosses_4
          puts "Chi-ching - that's the sound of #{@gross} this weekend."
        when "5"
          puts "More info on movie 5..."
          @gross = BoxOffice::Gross.scrape_grosses_5
          # @theaters = BoxOffice::Gross.scrape_theaters_5
          puts "Clocking in at #{@gross} for the weekend."
          # puts "Weekend Gross - #{@gross} - Theaters - #{@theaters}"
        end

      elsif input == 'list'
        list_gross
      elsif input == 'exit'
        puts 'See you later Alligator'
      else 
        puts "Not sure what you want, type list or exit"
      end
    end
  end

  def goodbye
    puts "Come back for more movie info next week!"
  end
end