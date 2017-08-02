class BestCompanies::CLI

  def call
    BestCompanies::Scraper.new.make_companies
    puts "Welcome! We're going to share with you the top 20 companies to work for!"
    menu
  end

  def menu
    puts ""
    puts "Select the number of the Top Company you'd like more info on or type exit:"
    input = gets.strip.to_i

    print_companies(input)

    puts ""
    puts "What company would you like more information on?"
    input = gets.strip

    company = BestCompanies::Company.find(input.to_i)

    print_companies(company)

    puts ""
    puts "Would you like to see another company? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    else
      puts ""
      puts "See you tomorrow for more on the Best Companies to Work For!!"
      exit
    end
  end

  def print_companies(company)
    puts "--------------------------------------"
    puts "♥ Best Companies to Work For:"
    puts ""
    puts "----------- #{company.name} - #{company.rank} -----------"
    puts ""
    puts "Location:           #{company.location}"
    puts "Industry:           #{company.industry}"
    puts "Year Founded:       #{company.year_founded}"
    puts ""
    puts "---------------Description--------------"
    puts ""
    puts "#{company.description}"
    puts ""
  end

  def print_companies(from_number)
    puts ""
    puts "---------- ♥ Best Companies to Work For ----------"
    puts ""
    BestCompanies::Company.all[from_number-1, 10].each.with_index(from_number) do |company, index|
      puts "#{index}. #{company.name} - #{company.rank}"
    end
  end

end
