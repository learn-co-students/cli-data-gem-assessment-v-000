########################################################################################################
#PURPOSE: To organize the Reddit_Thread objects into a list where each object can be
#easily found.
#
# Despite being called Reddit_Thread, it actually shows the attributes of a subreddit, not a thread.
########################################################################################################
class Reddit_Thread
  attr_accessor :subreddit, :current_users, :subscribers, :front_page_threads

  @@all = Array.new;

  def initialize(params)
    params.map do |key, value|
      self.send(("#{key}="), value)
    end
    @@all << self;
  end

  def self.find_by_name(subreddit_name)
    @@all.detect do | thread |
      thread.subreddit == subreddit_name
    end
  end

  def self.all
    @@all
  end


  def self.create(data)
    if Reddit_Thread.find_by_name(data[:subreddit]).nil?
      new_subreddit = Reddit_Thread.new(data)
    end
  end

end
