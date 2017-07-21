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

# doc.css("company-list.span").first.text
#pageContent > div.F500-list-page.container.small-12.columns > div.row > div > div:nth-child(1) > div.small-12.large-8.columns.list-wrapper > ul > li:nth-child(2)
