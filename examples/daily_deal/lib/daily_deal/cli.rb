#CLI Controller
class DailyDeal::CLI

  def call
    list_deals
    menu
    goodbye
  end

  def list_deals
    puts "Today's Daily Deals:"
    @deals = DailyDeal::Deal.today
    @deals.each.with_index(1) do |deal, i|
      puts "#{i}. #{deal.name} - #{deal.price} - #{deal.availability}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Please enter the number of the deal you'd like more info on, type 'list' to see all deals, or type 'exit'."
      input = gets.strip.downcase

      if input.to_i > 0
        the_deal = @deals[input.to_i-1]
        puts "#{the_deal.name} - #{the_deal.price} - #{the_deal.availability}"
        puts @deals[input.to_i-1]
      elsif input == "list"
        list_deals
      # else
      #   # puts "Are you deef? Try again!"
      #   puts "try again"
      end
    end
  end

  def goodbye
    # puts "Now fuck off, while you still have the legs that carry you."
    puts "goodbye"
  end
end
