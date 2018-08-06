class Topic
  #has many Portals
  @@all = []
  attr_accessor :name, :portals
  def initialize(name)
    @name = name
    @portals = []
    # add_portal
    @@all << self
  end

  def find_random_portal_page
    find_rand_portal = Scraper.scrape_portals_page(@name).sample
    # create_portal = Portal.find_rand_portal
    # return create_portal
  end

  def portals
    @portals
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    if self.all.detect{|topic| topic.name == name}
      @topic = self.all.detect{|topic| topic.name == name}
    else
      @topic = self.new(name)
    end
    @topic
  end

end
