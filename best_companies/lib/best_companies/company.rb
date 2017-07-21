class BestCompanies::Company
  attr_accessor :name, :rank, :url

  def self.year
    #scrape fortune best companies to work with and retun company
    self.scrape_companies
  end

  def self.scrape_companies
    companies = []

    companies << scrape_fortune

       # go to fortune website, find the company
       # extract the info wanted
       #instantiate the company

    companies
  end

    def self.scrape_fortune
      doc = Nokogiri::HTML(open("http://fortune.com/best-companies/list"))
      binding.pry
    end
end

#doc.css("a .company-title").first.text
