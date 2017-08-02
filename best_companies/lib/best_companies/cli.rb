class BestCompanies::CLI

  def call
    BestCompanies::Scraper.new.make_companies
    puts "Welcome! We're going to share with you the Top 20 Companies to Work For!"
    menu
  end

  def menu
    puts ""
    puts "What number companies would you like to see? 1-10, 11-20"
    input = gets.strip.to_i

    print_companies(input)

    puts ""
    puts "Please type the number of the company you would like more information on."
    input = gets.strip

    company = BestCompanies::Company.find(input.to_i)

    print_company(company)

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

  def print_company(company)
    puts ""
    puts "♥ Best Companies to Work For:"
    puts "----------- #{company.name} - Rank# #{company.rank} -----------"
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
    BestCompanies::Company.all[from_number-1, 20].each.with_index(from_number) do |company, index|
      puts "#{index}. #{company.name} - #{company.rank}"
    end
  end

end
