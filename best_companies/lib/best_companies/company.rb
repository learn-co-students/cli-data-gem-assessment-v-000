  class BestCompanies::Company
  attr_accessor :name, :rank, :url, :location, :industry, :year_started,


  def self.scrape_companies
    companies = []
    companies << scrape_fortune
    companies
  end

  def profile_info
    BestCompanies::Scraper.new.scrape_profile_url(self.profile_url)
  end
end
