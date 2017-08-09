require_relative './scraper'
require_relative './ailments'

class CommandLineInteface
  BASE_PATH = "https://www.anniesremedy.com/"

  def call
    print_options
    input = nil

    until input == "exit"
      print_instructions
      input = gets.strip

      if input.to_i == 1
        create_ailments
        print_all_ailments
        puts "Select a number of an ilness to discover it's respective herbal remedy, or type exit."
        while input != "exit"
          input = gets.strip
          search_remedy_for_ailment(input.to_i)
        end

      elsif input.to_i == 2
        puts "Top 65 Most Commonly Used Herbs"
        create_herbal_remedies
        add_herb_attributes
        display_herbal_remedies

      elsif input.to_i == 3
        puts "What Is Herbal Medicine?"
        display_text(Scraper.herbal_medicine)

      elsif input.to_i == 4
        puts "Benefits of Herbal Medicine"
        display_text(Scraper.benefits_of_h_m)

      elsif input.to_i == 5
        puts "Beneath The Surface of Healing: Mind, Body and Soul"
        display_text(Scraper.bonus)

      elsif input == "menu"
        print_options

      else
        puts "Please select a valid option..." unless input == "exit"
      end
    end
  end

  def print_options
    puts ""
    puts "Welcome to Herbal Remedies!"
    puts ""
    puts "1. Herbal Remdies for Common Ailments"
    puts "2. Top 65 Most Commonly Used Herbs" #=> New Feature
    puts "3. What Is Herbal Medicine?"
    puts "4. Benefits of Herbal Medicine"
    puts "5. BONUS: Beneath The Surface of Healing: Mind, Body and Soul"
    puts ""
  end

  def print_instructions
    puts "-----------------------------------------------------------------"
    puts "Choose a number from the list above to learn more or enter 'exit'."
    puts "To see the list of options again, enter 'menu'."
    puts ""
  end

  def create_ailments
    Ailment.create_from_hash(Scraper.ailment_remedy_hash)
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
    array = Ailment.all
    puts "#{array[a-1].name}: #{array[a-1].remedy.join(", ")}"
  end

  def display_text(from_scraper)
    from_scraper.each do |info|
      puts ""
      puts info.text
      puts ""
    end
  end

  def create_herbal_remedies
    Herbs.create_herbs_from_hash(Scraper.herb_names_and_path_hash)
  end

  def add_herb_attributes
    Herbs.all.each do |herb|
      attributes_hash = Scraper.herb_attributes_hash(BASE_PATH + herb.path)
      herb.add_herb_attributes(attributes_hash)
    end
  end

  def display_herbal_remedies
    Herbs.all.each do |herb|
      puts " #{herb.name.upcase}"
      puts ""
      puts "  Medical uses:" + " #{herb.medicinal_uses}"
      puts ""
      puts "  Properties:" + " #{herb.properties}"
      puts ""
      puts "  Preparation:" + " #{herb.preparation}"
      puts ""
      puts "----------------------"
    end
  end

end
