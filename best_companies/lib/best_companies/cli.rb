class BestCompanies::CLI

  def call
    get_page
    menu
  end

    def get_page
      puts "Welcome! We're going to share with you the top 20 companies to work for!"

    end

  def menu
    input = nil
    while input != "exit"
      puts "Type 'list' to see the companies, or select the number of the company you'd like more info on, or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0
        @companies.each.with_index(0) do |company, i|
          puts "--------------------------------------"
          puts "You have selected - #{[input.to_i]}"
          puts "#{company.name[input.to_i]} - #{company.rank[input.to_i-1]}"
          puts "--------------------------------------"
        end
      elsif input == "list"
        list_companies
      elsif input == "exit"
        puts "--------------------------------------"
        puts "See you tomorrow for more on the Best Companies to Work For!!"
      else
        puts "--------------------------------------"
        puts "Oops! Not sure what you want, type list or exit"
      end
    end
  end

  def list_companies
    @companies = BestCompanies::Company.year

    puts "♥ Best Companies to Work For:"
    @companies.each do |company|
      puts "#{company.name[0]} - #{company.rank[0]}"
      puts "#{company.name[1]} - #{company.rank[1]}"
      puts "#{company.name[2]} - #{company.rank[2]}"
      puts "#{company.name[3]} - #{company.rank[3]}"
      puts "#{company.name[4]} - #{company.rank[4]}"
      puts "#{company.name[5]} - #{company.rank[5]}"
      puts "#{company.name[6]} - #{company.rank[6]}"
      puts "#{company.name[7]} - #{company.rank[7]}"
      puts "#{company.name[8]} - #{company.rank[8]}"
      puts "#{company.name[9]} - #{company.rank[9]}"
      puts "#{company.name[10]} - #{company.rank[10]}"
      puts "#{company.name[11]} - #{company.rank[11]}"
      puts "#{company.name[12]} - #{company.rank[12]}"
      puts "#{company.name[13]} - #{company.rank[13]}"
      puts "#{company.name[14]} - #{company.rank[14]}"
      puts "#{company.name[15]} - #{company.rank[15]}"
      puts "#{company.name[16]} - #{company.rank[16]}"
      puts "#{company.name[17]} - #{company.rank[17]}"
      puts "#{company.name[18]} - #{company.rank[18]}"
      puts "#{company.name[19]} - #{company.rank[19]}"
    end
  end


end
