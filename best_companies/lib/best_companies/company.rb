  class BestCompanies::Company
  attr_accessor :name, :rank, :url, :location, :employees, :industry, :year, :organization


  def self.scrape_companies
    companies = []
    companies << scrape_fortune
    companies
  end

  def profile_info
    BestCompanies::Scraper.new.scrape_profile_url(self.profile_url)
  end
end
