class StayRelevant::CLI

  def call 
    list_trends
    menu
    goodbye
  end

 def list_trends
  puts "Learn this to stay relevant:"
  @trends = StayRelevant::Trend.today
  @trends.each.with_index(1) do |trend, i|
  puts "#{i}. #{trend.name}"
end 
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the trend you'd like more info on or type list to see the trends again or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0
        the_trend = @trends[input.to_i-1]
        puts "#{the_trend.name}"
      elsif input == "list"
        list_trends
      else
        puts "Not sure what you want, type list or exit."
      end
    end
  end

  def goodbye 
    puts "See you tomorrow for more trends!"
  end
 
end
