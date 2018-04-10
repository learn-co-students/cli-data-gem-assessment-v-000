require_relative "../lib/scraper.rb"

class Portal
  #belongs_to topic
  #has_many Facts
  attr_accessor :url, :facts, :topic
  @@all = []

  def initialize(url)
    # (name, url)
    # @name = name
    # @url = url
    @url = url
    @facts = []
    @@all << self
  end

  def self.random_fact
    return Scraper.scrape_portal_dyk(@random_portal).sample
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_url(url)
    if Portal.all.detect{|portal| url == portal.url}
      @portal = Portal.all.detect{|portal| url == portal.url}
    else
      @portal = Portal.new(url)
      @@all << @portal
    end
  end
end
