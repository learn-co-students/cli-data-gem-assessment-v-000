class BestCompanies::Company
  attr_accessor :name, :rank, :profile_url, :location, :industry, :year_founded

  def self.year
    self.scrape_companies
  end

  def self.scrape_companies
    companies = []
    companies << self.scrape_fortune
    companies
  end

  def self.scrape_fortune
    doc = Nokogiri::HTML(open("http://fortune.com/best-companies/list"))
    company_list = doc.css("ul.company-list li").text.scan(/\d+|\D+/)
    company_names = []

    company = self.new
    company.rank = company_list.select{|x| company_list.index(x) % 2 == 0}
    company.name = company_list.select{|x| company_list.index(x) % 2 != 0}
    company.profile_url = company_names

    #Create list of profile urls from company_name list
    company_name = company.name
    company_name.map{|name| company_names << ("http://fortune.com/best-companies/" + name.downcase.split.join("-"))}
    #Remove '&' from company_name

    # company_names.each do |url|
    #   page = Nokogiri::HTML(open(url))
    #   company.location = page.css('div.row.company-info-card-table').css('.row').css('p')[5].text
    #   company.industry = page.css('div.row.company-info-card-table').css('.row').css('p')[11].text
    #   company.year_founded = page.css('div.row.company-info-card-table').css('.row').css('p')[15].text
    # end
    company
  end
end
