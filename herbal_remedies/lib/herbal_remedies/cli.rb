
class CommandLineInteface
  BASE_PATH = "https://www.anniesremedy.com/"

  def call
    print_options

    input = nil

    until input == "exit"
      print_instructions
      input = gets.strip

      if input.to_i == 1
        puts 'Common Ailments:'
        create_ailments
        print_all_ailments
        loop do
          input = gets.strip
          if input.to_i > 0
            search_remedy_for_ailment(input.to_i)
          elsif input.downcase == "all"
            display_all_remedies_for_ailments
          elsif input == "exit"
            break
          elsif input == "menu"
            call
          else
            puts "Please select a valid option. You can also enter 'menu' or 'exit':"
          end
        end

      elsif input.to_i == 2
        puts "Top 65 Most Commonly Used Herbs:"
        create_herbal_remedies
        add_herb_attributes
        display_herbal_remedies
        loop do
          input = gets.strip
          if input.to_i > 0
            search_herbal_remedy(input.to_i-1)
          elsif input == "menu"
            call
          elsif input == "exit"
            break
          else
            puts "Please select a valid option. You can also enter 'menu' or 'exit':"
          end
        end

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
    puts "To see the menu again, enter 'menu'."
    puts ""
  end

  def create_ailments
    Ailment.create_from_hash(Scraper.ailment_remedy_hash)
  end

  def print_all_ailments
    puts ''
    Scraper.scrape_ailments.each_with_index do |ailment, i|
      puts "#{i+1}. #{ailment}"
    end
    puts ""
    puts "Select a number of an ilness to discover it's respective herbal remedy."
    puts "You can also enter 'all' to see all remedies or enter exit:"
  end

  def search_remedy_for_ailment(input)
    array = Ailment.all
    puts "#{array[input-1].name}: #{array[input-1].remedy.join(", ")}"
    puts ""
  end

  def display_all_remedies_for_ailments
    puts ""
    Ailment.all.each {|a| puts " #{a.name}: #{a.remedy.join(", ")}"}
    puts ""
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
    Herbs.all.each_with_index do |herb, index|
      puts " #{index+1}. #{herb.name}"
    end
    puts ""
    puts "Select a number of the herb you would like to learn more about:"
  end

  def search_herbal_remedy(input)
    array = Herbs.all
    puts " #{array[input].name.upcase}"
    puts ""
    puts "  Medical uses:" + " #{array[input].medicinal_uses}"
    puts ""
    puts "  Properties:" + " #{array[input].properties}"
    puts ""
    puts "  Preparation:" + " #{array[input].preparation}"
    puts ""
    puts "----------------------"
  end

end
