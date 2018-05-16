########################################################################################################
#PURPOSE: To scrape teh appropriate reddit webpages for the needed data.
#Is able to scrape the front page of any reddit webpage by just giving the subreddit name.
#The only exception nis the trendingsubreddits call, made in #initialize, as it is the root page for
#this program.
#
# Theh user agent is changed on each call to ensure the site doesn't get overwhelmed with numerous direct calls to its server.
########################################################################################################
require 'pry'
require 'open-uri'
require 'nokogiri'
require "net/http"

class Scraper
  attr_accessor :file, :parsed_file, :simple_data

  def initialize
    @simple_data = Array.new;
    @file = open('https://www.reddit.com/r/trendingsubreddits/', 'User-Agent' => 'Nooby')
    @parsed_file = Nokogiri::HTML.parse(@file)
    @thread_data = @parsed_file.css('.thing')
    parse_trending_subreddits_data();
  end

  def parse_trending_subreddits_data
    today_data = @thread_data[0]
    @simple_data = { }
    title = today_data.css("a.title")[0].text
    date = title.split(": ")[0].split(" ").pop
    subreddits = title.split(": ")[1].split(", ")
    @simple_data[:subreddits] = subreddits
  end

  def self.scrape_subreddit(subreddit_name)
    link = "https://www.reddit.com" + subreddit_name
    fresh_data = Nokogiri::HTML.parse( open(link, 'User-Agent' => 'Nooby') )
    quick_data = fresh_data.css(".thing")

    subscribers = fresh_data.css(".subscribers").css(".number").text
    amt_online = fresh_data.css(".users-online").css(".number").text
    description = fresh_data.css(".md").text.to_s

    data = {}
    data[:subreddit] = subreddit_name
    data[:current_users] = amt_online
    data[:subscribers] = subscribers
    data[:front_page_threads] = quick_data.collect do | code |
      thread = { }
      thread[:title] = code.css("a.title").text
      thread[:link] = code["data-permalink"]
      thread
    end
    Reddit_Thread.create(data)
  end

end
