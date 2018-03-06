require_relative "../lib/scraper.rb"

class Portal
  #belongs_to topic
  #has_many Facts
  attr_accessor :url, :topic
  @@all = []

  def initialize
    @facts = []
  end

  def self.random_fact
    return Scraper.scrape_portal_dyk(@random_portal).sample
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_url(url)
    @url = url
    if Portal.all.detect{|item| url == @portal_url}
      @portal = Portal.all.detect{|item| url == @portal_url}
    else
      @portal = Portal.new(url)
      @portal.topic =
      @@all << @portal
    end
  end
end
