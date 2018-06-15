#CLI Controller
class DailyFitness::CLI

  def call
    introductory_message
    #Calls the intro method
    choose
    #Calling choose method
  end

  def introductory_message
    #Introductory message is first to pop up when activating the CLI.
    puts "Hello! Are you ready to supplement your fitness lifestyle?".colorize(:green) + "
    \nChoose between four options.
    Press “1” for the Nutritional Article of the day,
    Press “2” for the Workout Article of the day,
    Press “3” for the Supplementation Article of the day,
    Press “4” for the Motivational Article of the day."
  end

  def choose
    #After the introductory message, the put below is a fun welcoming one to engage
    #the user.
    puts "\nPlease proceed with one of the options above if you are serious about your gains!".colorize(:green) +
    " \nIf you do not want to continue, just type 'exit'.".colorize(:red)
    input = nil
    while input != "exit"
    input = gets.strip
      case input
        #each case number is assigned to a specific section in bodybuilding.com
        #covering various topics.
        when "1"
          nutritional_article
        when "2"
          workout_article
        when "3"
          supplement_article
        when "4"
          motivation_article
        when "exit"
          closing_message
        else
          #If the user does not enter a number 1-4, this message will remind
          #them to go over the rules again.
          puts "That is not an option,
          Press “1” for the Nutritional Article of the day,
          Press “2” for the Workout Article of the day,
          Press “3” for the Supplementation Article of the day,
          Press “4” for the Motivational Article of the day,
          Or type 'exit' if you do not want to continue."
      end
    end
  end

  def list
    #The list will be called each time an article is activated in the CLI
    #This will ensure the CLI instructions will always be present to the user
    puts"
    Press “1” for the Nutritional Article of the day,
    Press “2” for the Workout Article of the day,
    Press “3” for the Supplementation Article of the day,
    Press “4” for the Motivational Article of the day,
    Or type 'exit' if you do not want to continue."
  end

  def closing_message
    puts "\nCome back later for daily fitness information and motivation, Goodbye!".colorize(:green)
  end

  def workout_article
    @article = DailyFitness::Workout.info
    #Goes into the DailyFitness Workout Class and calls the self.info method
    @article.each do |article|
      puts "------------------------"
      puts "\n#{article.title}".colorize(:green) + "\n\n#{article.description}" +
      "\n\nClick on the link to view the full report -" + " #{article.url}".colorize(:light_blue)
      puts "\n------------------------"
    end
    list
  end

  def nutritional_article
    @article = DailyFitness::Nutrition.info
    #Goes into the DailyFitness Nutrition Class and calls the self.info method
    @article.each do |article|
      puts "------------------------"
      puts "\n#{article.title}".colorize(:green) + "\n\n#{article.description}" +
      "\n\nClick on the link to view the full report -" + " #{article.url}".colorize(:light_blue)
      puts "\n------------------------"
    end
    list
  end

  def supplement_article
    @article = DailyFitness::Supplement.info
    #Goes into the DailyFitness Supplment Class and calls the self.info method
    @article.each do |article|
      puts "------------------------"
      puts "\n#{article.title}".colorize(:green) + "\n\n#{article.description}" +
      "\n\nClick on the link to view the full report -" + " #{article.url}".colorize(:light_blue)
      puts "\n------------------------"
    end
    list
  end

  def motivation_article
    @article = DailyFitness::Motivation.info
    #Goes into the DailyFitness Motivation Class and calls the self.info method
    @article.each do |article|
      puts "------------------------"
      puts "\n#{article.title}".colorize(:green) + "\n\n#{article.description}" +
      "\n\nClick on the link to view the full report -" + " #{article.url}".colorize(:light_blue)
      puts "\n------------------------"
    end
    list
  end
end
