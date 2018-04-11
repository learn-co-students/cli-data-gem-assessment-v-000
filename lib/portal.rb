require_relative "../lib/scraper.rb"

class Portal
  #belongs_to topic
  #has_many Facts
  attr_accessor :url, :topic, :facts
  @@all = []

  def initialize(url, topic)
    @url = url
    @topic = topic
    @facts = []
    @@all << self
  end

  # def saveToTopic(name)
  #   topic = Topic.find_by_name(name)
  #   topic.portals << self
  #   topic.save
  # end

  def self.random_fact
    return Scraper.scrape_portal_dyk(@random_portal).sample
  end

  def self.all
    @@all
  end

  def self.facts
    @facts
  end

  def self.find_or_create_by_url(url, topic)
    if Portal.all.detect{|portal| url == portal.url}
      portal = Portal.all.detect{|portal| url == portal.url}
    else
      portal = Portal.new(url, topic)
      # binding.pry
      @@all << portal
      portal
    end
  end
end
