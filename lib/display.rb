########################################################################################################
#PURPOSE: The main UI for the program
########################################################################################################
class Display
  def welcome
    self.show_trending
  end

  def show_trending
    ########################################################################################################
    #PURPOSE: scrape www.reddit.com/r/trendingsubreddits page to find the subreddits that are trending for that day
    # Display the main menu
    ########################################################################################################
    system "clear"
    #convert the current date to a more read-friendly format
    date = Time.now.strftime("%B %d %C%y")

    scrap = Scraper.new
    trending_list = scrap.simple_data[:subreddits]
    n = 1;
    puts "Trending Subreddits for #{date}"
    puts "-------------------------------"
    trending_list.each do | subreddit |
      puts "#{n}. #{subreddit}"
      n += 1
    end
    puts "Enter the subreddit you'd like to explore or 'exit' to quit:"
    input = gets.chomp
    puts "-------------------------------"
    if input.to_i < 1 || input.to_i > n
      if input.downcase == "exit"
        puts "Good-bye!"
      else
          self.show_trending
      end
    else
        self.view_subreddit(trending_list[input.to_i - 1])
    end
  end

  def view_subreddit(subreddit)
    ########################################################################################################
    #PURPOSE: Use the name of the thread found on /r/trendingsubreddits to find the appropriate subreddit
    #site to scrape.
    #Displays the subreddit's current users, subscribers, and front page topics.
    #The user can return to the main menu by pressing enter
    #If their ruby console allows, they can access the subreddit by clicking the link shown or by copying
    #it and pasting it in a browser.
    ########################################################################################################
    Scraper.scrape_subreddit(subreddit)
    thread = Reddit_Thread.find_by_name(subreddit)
    puts "***************************"
    puts "LOADING SUBREDDIT DETAILS"
    puts "***************************"
    puts "#{subreddit}"
    puts "-------------------------------"
    puts "Users Online: #{thread.current_users}/#{thread.subscribers}"
    puts "Frontpage Threads"
    thread.front_page_threads.each do | topic |
     puts "Thread: #{topic[:title]}"
     puts "Link: https://www.reddit.com#{topic[:link]}\n\n"
    end
     puts "----------------------------"
     puts "Press [ Enter ] to Continue..."
     gets.chomp
     self.show_trending
  end

end
