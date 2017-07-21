#CLI controller

 class BestCompanies::CLI

   def call
     BestCompanies::Scraper.new.scrape_fortune
     list_companies
     menu
     goodbye
   end

   def list_companies
     puts "♥ Best Companies to Work For:"
     @companies.each_with_index(1) do |company, i|
       puts "#{i}. #{company.name} - #{company.rank}"
     end
   end


    def menu
     input = nil
     while input != "exit"
       puts "Enter the number of the company you'd like more info on or type list to see the deals again or type exit:"
       input = gets.strip.downcase

       if input.to_i > 0
         the_company = @companies[input.to_i-1]
         puts "#{i}. #{company.name} - #{company.rank}"
       #elsif #More info about selected company or return to main list

       elsif input == "list"
         list_companies
       else
         puts "Oops! Not sure what you want, type list or exit"
       end
     end
   end

  def goodbye
     puts "See you tomorrow for more on the Best Companies to Work For....xoxo"
 end
end
