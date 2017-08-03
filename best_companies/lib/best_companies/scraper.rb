class BestCompanies::Scraper

  def get_page
      Nokogiri::HTML(open("http://fortune.com/best-companies/list"))
    end

    def scrape_companies_index
      self.get_page.css("ul.company-list li")
    end

    def make_companies
      scrape_companies_index.each do |c| #'c' is filtering through the li to select the one that is called in the CLI
        BestCompanies::Company.new_from_index_page(c)
    end
  end
end
