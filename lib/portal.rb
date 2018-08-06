class Portal
  attr_accessor :url, :topic, :name
  @@all = []

  def initialize(url)
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_url(url)
    if Portal.all.detect{|portal| url == portal.url}
      @portal = Portal.all.detect{|portal| url == portal.url}
    else
      @portal = Portal.new(url)
      @portal
    end
  end
end
