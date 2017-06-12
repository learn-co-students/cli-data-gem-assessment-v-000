#CLI controller
class TwitterWurst::CLI

  def call
    list_tweets
    menu
    goodbye
  end

  def list_tweets
    puts "Today's Worst tweets"
    @tweets = TwitterWurst::Tweet.today #write this before beginning to define any methods, as an approximation of how you'll want this to work
    @tweets.each.with_index(1) do |tweet, i|
      puts "#{i}, #{tweet.content} - #{tweet.twit}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the user's tweets you'd like to see more of, type 'list' to see today's twits again, or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0
        the_tweet = @tweets[input.to_i-1]
        puts "#{the_tweet.content} - #{the_tweet.twit}" 
      elsif input  == "list"
        list_tweets
      else
        puts "Please select a twit, type 'list', or exit."
      # case input
      # when "1"
      #   puts "More of USER 1's tweets:"
      # when "2"
      #   puts "More of USER 2's tweets:"
      # when "list"
      #   list_tweets
      # else
      end
    end
  end

  def goodbye
    puts "LOSER!"
  end
end
