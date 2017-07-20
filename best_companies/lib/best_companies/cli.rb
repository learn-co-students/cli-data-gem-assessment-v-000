#CLI controller

 class BestCompanies::CLI

   def call
     puts "♥ Best Companies to Work For:"
     list_companies
     menu
     goodbye
   end

   def list_companies
     @companies = BestCompanies::Company.year
   end

    def menu
     input = nil
     while input != "exit"
       puts "Enter the number of the company you'd like more info on or type list to see the deals again or type exit:"
       input = gets.strip.downcase
       case input
       when "1"
         puts "More info on deal 1..."
       when "2"
         puts "More info on deal 2..."
       when "list"
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
