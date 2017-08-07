require_relative './scraper'
require_relative './ailments'

class CommandLineInteface

  def call
    print_options
    input = nil
    while input != "exit"
      puts "-----------------------------------------------------------------"
      puts "Choose a number from the list above to learn more or enter 'exit'"
      puts "To see this list again, enter 'menu'"
      puts ""
      input = gets.strip
      if input.to_i == 1
        Ailment.create_from_hash(Scraper.ailment_remedy_hash)
        print_all_ailments
        puts "Select a number of an ilness to discover it's respective herbal remedy, or type exit."
        while input != "exit"
          input = gets.strip
          search_remedy_for_ailment(input.to_i)
        end
      elsif input.to_i == 2
        puts "What Is Herbal Medicine?"
        display(Scraper.herbal_medicine)
      elsif input.to_i == 3
        puts "Benefits of Herbal Medicine"
        display(Scraper.benefits_of_h_m)
      elsif input.to_i == 4
        puts "Beneath The Surface of Healing: Mind, Body and Soul"
        display(Scraper.bonus)
      elsif input == "menu"
        print_options
      else
        puts "Please select a valid option..."
      end
    end
  end

  def print_all_ailments
    puts 'Common Ailments:'
    puts ''
    Scraper.scrape_ailments.each_with_index do |ailment, i|
      puts "#{i+1}. #{ailment}"
    end
    puts ""
  end

  def search_remedy_for_ailment(a)
    ary = Ailment.all
    puts "#{ary[a-1].name}: #{ary[a-1].remedy.join(", ")}"
  end

  def print_options
    puts ""
    puts "Welcome to Herbal Remedies!"
    puts ""
    puts "1. Herbal Remdies for Common Ailments"
    puts "2. What Is Herbal Medicine?"
    puts "3. Benefits of Herbal Medicine"
    puts "4. BONUS: Beneath The Surface of Healing: Mind, Body and Soul"
    puts ""
  end

  def display(from_scraper)
    from_scraper.each do |info|
      puts ""
      puts info.text
      puts ""
    end
  end

end
