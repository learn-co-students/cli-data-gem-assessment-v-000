
class CommandLineInteface
  BASE_PATH = "https://www.anniesremedy.com/"

  def start
    # create_ailments
    create_herbal_remedies
    add_herb_attributes
  end

  def call
    print_options
    input = nil
    until input == "exit"
      print_instructions
      input = gets.strip

      # if input.to_i == 1
      #   puts 'Common Ailments:'
      #   print_all_ailments
      #   loop do
      #     input = gets.strip
      #     if input.to_i > 0
      #       search_remedy_for_ailment(input.to_i)
      #     elsif input.downcase == "all"
      #       display_all_remedies_for_ailments
      #     elsif input == "exit"
      #       break
      #     elsif input == "menu"
      #       call
      #     else
      #       puts "Please select a valid option. You can also enter 'menu' or 'exit':"
      #     end
      #   end

      if input.to_i == 1
        puts "Top 65 Most Commonly Used Herbs:"
        display_herbal_remedies
        loop do
          puts "Here you can also enter 'search', 'all', 'menu' or 'exit':"
          input = gets.strip
          if input.to_i > 0
            search_herbal_remedy(input.to_i-1)
          elsif input == "search"
            loop do
              puts "Would you like to search by Medicinal Use or Properties (M/P)"
              input = gets.strip.downcase
              if input == "m"
                until input == "exit"
                  puts "Enter the Medicinal Use or condition you would like to search for or type 'exit':"
                  input = gets.strip
                  search_by_medicinal_use(input)
                end
              elsif input == "p"
                until input == "exit"
                  puts "Enter the Herbal Property you would like to search for or type 'exit':"
                  input = gets.strip
                  search_by_properties(input)
                end
              elsif input == "exit"
                break
              else
                puts "Please type 'M' or 'P'"
              end
            end
          elsif input == "menu"
            call
          elsif input == "exit"
            break
          elsif input == "all"
            display_herbal_remedies
          else
            puts "Please select a valid option. You can also enter 'menu' or 'exit':"
          end
        end

      elsif input.to_i == 2
        puts "What Is Herbal Medicine?"
        display_text(Scraper.herbal_medicine)

      elsif input.to_i == 3
        puts "Benefits of Herbal Medicine"
        display_text(Scraper.benefits_of_h_m)

      elsif input.to_i == 4
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
    puts "1. Top 65 Most Commonly Used Herbs"
    puts "2. What Is Herbal Medicine?"
    puts "3. Benefits of Herbal Medicine"
    puts "4. BONUS: Beneath The Surface of Healing: Mind, Body and Soul"
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
    Ailment.all.each_with_index do |ailment, i|
      puts "#{i+1}. #{ailment.name}"
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

  # def display_all_remedies_for_ailments
  #   puts ""
  #   Ailment.all.each {|a| puts " #{a.name}: #{a.remedy.join(", ")}"}
  #   puts ""
  # end

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
    puts "Select the number of the herb you would like to learn more about."
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

  def search_by_medicinal_use(input)
    puts ""
    if Herbs.search_by_medicinal_use(input) != []
      puts ""
      puts "The fallowing herbs are good for #{input}:"
      Herbs.search_by_medicinal_use(input).each do |herb|
        puts herb.name.upcase
        puts ""
        puts "Other Medical Uses: " + herb.medicinal_uses
        puts ""
        puts "Properties: " + herb.properties
        puts ""
      end
    else
      puts "Try again:"
    end
  end

  def search_by_properties(input)
    puts ""
    if Herbs.search_by_properties(input) != []
      Herbs.search_by_properties(input).each do |herb|
        puts herb.name.upcase
        puts ""
        puts herb.properties
        puts ""
      end
    else
      puts "Try again:"
    end
  end

end
