class ClevelandMuseumEvents::Events
  attr_accessor :title, :description, :url, :in_depth_description

  @@events = []

  def initialize(title = nil, description = nil, url = nil, in_depth_description = nil)
   @title = title
   @url = "http://www.clevelandart.org#{url}"
   @description = description
   @in_depth_description = in_depth_description
   @@events << self
  end

  def self.all
    @@events
  end

  def self.events
    title = @@events[0]
    title
  end

  def self.description
    description
  end

  def self.url
    url
  end

  def self.in_depth_description

  end

end
