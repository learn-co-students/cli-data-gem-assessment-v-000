require 'pry'

class TwitterWurst::Tweet
  attr_accessor :content, :twit, :url, :interactions, :rank




  def self.today
    #scrape twitter; return Trump admin tweets
    self.scrape_twits
    #should return today's worst tweets
    # <<-DOC is called heredoc
    #.gsub /^\s*/,'' removes leading space before 1. and 2.
    # puts <<-DOC.gsub /^\s*/,''
    #   1. World's worst FBI Director. SAD!
    #   2. This is the big one, folks. We're gonna make 'em all beg for their mothers, believe me.
    # DOC
    # tweet_1 = self.new
    # tweet_1.content = "World's worst FBI Director. SAD!"
    # tweet_1.twit = "@realdonaldtrump"
    # tweet_1.url = "http://www.twitter.com/realdonaldtrump"
    #
    # tweet_2 = self.new
    # tweet_2.content = "This is the big one, folks. We're gonna make 'em all beg for their mothers, believe me."
    # tweet_2.twit = "@potus"
    # tweet_2.url = "http://www.twitter.com/potus"
    #
    # [tweet_1, tweet_2]
  end

  def self.scrape_tweets
    all = []
    doc = Nokogiri::HTML(open"(https://www.twitter.com/#{:handle}")

    Twit.tweets << all
  end

  def self.scrape_twits
    tweets = []
    tweets << Twit.scrape_tweets
    #Go to Twit's Twitter page
    #Pull most recent 100 tweets
    #<---Come up with some sort of criteria for determining the "worst" ones--->
    #list them in order
    tweets
  end
end
