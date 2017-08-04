require_relative './scraper'
require_relative './ailments'

class CommandLineInteface

  def call

    puts 'Welcome to Hebal Remedies'
    puts'Which of the options bellow would you like to learn more about?'
    puts ''
    puts '1. Herbal Remdies for Common Ailments'
    puts '2. What Is Herbal Medicine?'
    puts '3. Benefits of Herbal Medicine'
    puts '4. BONUS: Controversial Divine Remedy for All Ailments'
    puts ''

    input = input = gets.strip.to_i

      if input == 1
        Ailment.create_from_hash(Scraper.ailment_remedy_hash)
        print_all_ailments
        puts "Select a number of an ilness to discover it's respective herbal remedy:"
        input = gets.strip.to_i
        search_remedy_for_ailment(input)
      elsif input == 2
        puts "text with more info"
      elsif input == 3
        puts "text with even more info"
      elsif input == 4
        puts "Bonus"
      else
        puts "please select a valid option"
      end

  end

  def print_all_ailments
    puts 'Common Ailments'
    puts ''
    Scraper.scrape_ailments.each_with_index do |ailment, i|
      puts "#{i+1}. #{ailment}"
    end
    puts ""
  end

  def search_remedy_for_ailment(a)
    ary = Ailment.all
    puts "#{ary[a].name}: #{ary[a].remedy}"
  end

end
