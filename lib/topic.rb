class Topic
  extend ScraperModule
  attr_accessor :name
  def initialize(name)
    @name = name
  end
  
  def create_by_selection
    ScraperModule::Scraper.scrape_portals_page(@name)
    #creates an array of all portal links in the chosen topic
  end
end