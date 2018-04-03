# class for user to interact with the app and give commands

 class BmaCurrentExhibitCliApp::CLI
   #welcomes the user, lets them know what they are about to see, and lists the exhibits
  def call
    puts" Welcome, art lover!"
    puts" Here are the current exhibitions at the Baltimore Museum of Art"
    list_exhibits
    menu
  end
  #lists exhibits from museum. Will change to scraped info one scraper class built
  def list_exhibits
    puts " 1) Vangogh - Through July 2017"
    puts " 2) Monet - Through Oct 2018"
    puts " 3) Warhol- Through Nov 2018"
  end
  #gives user the option to get more info about each exhibit, go back to menu, or exit
  def menu
    puts "Enter the number of the exhibit to learn more about it. If you want to see the list again, enter 'list'.
    If you want to exit, type 'exit'."
    input = gets.strip
      if input == "1"
        puts " Cut off his ear"
        menu
      elsif input == "2"
          puts "swishy paint man"
          menu
        elsif input == "3"
          puts "15 minutes of fame"
          menu
        elsif input == "list"
          list_exhibits
          menu
        else
          puts" Thanks for checking this out! See you next time!"
          exit
        end
      end

 end
