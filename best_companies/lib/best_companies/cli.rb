class BestCompanies::CLI

  def call
    BestCompanies::Scraper.new.make_companies
    puts "Welcome! We're going to share with you the Top 20 Companies to Work For!"
    menu
  end

  def menu
    puts ""
    puts "Please select the number companies you would like to see. (Ex. 1-10, 11-20. We will list 10 at a time.)"
    input = gets.strip.to_i

    print_companies(input)

    puts ""
    puts "Please type the number of the company you would like more information on."
    input = gets.strip.to_i

    if input >20 || input <=0
      puts "Opps!! Please select a number between 1 - 20"
    else
    company = BestCompanies::Company.find(input.to_i)
    BestCompanies::Scraper.scrape_details(company)

    print_company(company)
  end
    puts ""
    puts "Would you like to see another company? Enter Y or N"
    input = gets.strip.downcase
    if input == "y"
      menu

    else
      goodbye
    end
  end

  def goodbye
    puts ""
    puts "----------- Goodbye! -----------"
    puts "See you tomorrow for more on the Best Companies to Work For!"
    exit
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
    puts "----------- Description -----------"
    puts ""
    puts "#{company.description}"
    puts ""
  end

  def print_companies(from_number)
    puts ""
    puts "---------- Companies #{from_number} - #{from_number+9} ----------"
    puts ""
    BestCompanies::Company.all[from_number-1, 10].each.with_index(from_number) do |company, index|
      puts "#{index}. #{company.name} - #{company.rank}"
    end
  end

end
