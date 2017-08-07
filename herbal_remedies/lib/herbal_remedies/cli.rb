require_relative './scraper'
require_relative './ailments'

class CommandLineInteface

  def call
    print_options
    input = gets.strip.to_i
      if input == 1
        Ailment.create_from_hash(Scraper.ailment_remedy_hash)
        print_all_ailments
        puts "Select a number of an ilness to discover it's respective herbal remedy, or type exit."
        while input != "exit"
          input = gets.strip
          search_remedy_for_ailment(input.to_i)
        end
      elsif input == 2
        display_what_is_h_m?
      elsif input == 3
        display_benefits_of_h_m
      elsif input == 4
        display_bonus
      else
        puts "please select a valid option"
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
    puts "#{ary[a].name}: #{ary[a].remedy.join(", ")}"
  end

  def print_options
    puts 'Welcome to Herbal Remedies!'
    puts 'Choose a number from the options bellow to learn more.'
    puts ''
    puts '1. Herbal Remdies for Common Ailments'
    puts '2. What Is Herbal Medicine?'
    puts '3. Benefits of Herbal Medicine'
    puts '4. BONUS: Beneath The Surface of Healing: Mind, Body and Soul'
    puts ''
  end

  def display_what_is_h_m?
    Scraper.herbal_medicine.each do |info|
      puts "#{info.text}"
      puts ""
    end
  end

  def display_benefits_of_h_m
    Scraper.benefits_of_h_m.each do |info|
      puts "#{info.text}"
      puts ""
    end
  end

  def display_bonus
    Scraper.bonus.each do |info|
      puts info.text
      puts ""
    end
  end

end
