require_relative "../lib/scraper.rb"

class Portal
  #belongs_to topic
  #has_many Facts
  attr_accessor :url, :topic
  @@all = []

  def initialize
    # (name, url)
    # @name = name
    # @url = url
    @facts = []
  end

  def self.random_fact
    return Scraper.scrape_portal_dyk(@random_portal).sample
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_url(name, url)
    if Portal.all.detect{|item| name == item.name}
      @portal = Portal.all.detect{|item| name == item.name}
    else
      @portal = Portal.new(url)
      @@all << @portal
    end
  end
end
