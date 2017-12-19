class ClevelandMuseumEvents::Events
  attr_accessor :title, :description, :url

  @@events = []

  def initialize(title = nil, description = nil, url = nil)
   @title = title
   @url = url
   @description = description
   @@events << self
  end

  def self.all
      @@events
  end

  def self.events
    title = @@events[0]
    title
  end

  def self.index
    @@events
  end

  def self.description
    description = @@description.flatten
    description
  end

  def self.url
    url = @@url.flatten
    url
  end
end
