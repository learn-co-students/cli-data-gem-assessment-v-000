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

  # def self.index
  #   @@events
  # end

  def self.description
    description
  end

  def self.url
    url
  end

  # def open_in_browser
  #   system("open '#{url}'")
  # end
end
