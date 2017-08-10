class BestCompanies::Scraper

  def get_page
      Nokogiri::HTML(open("http://fortune.com/best-companies/list"))
    end

    def scrape_companies_index
      self.get_page.css("ul.company-list li")
    end

    def make_companies
      scrape_companies_index.each do |c|
        new_from_index_page(c)
    end
  end

  def new_from_index_page(c)
   BestCompanies::Company.new(
      c.css("span.company-title").text,  #name
      c.css("span.company-rank").text, #rank
      "http://fortune.com/#{c.css("a").attribute("href").text}"
      )
  end

  def self.scrape_details(company)
    doc = Nokogiri::HTML(open(company.url))

    company.location = doc.css('div.row.company-info-card-table').css('.row').css('p')[5].text,
    company.industry = doc.css('div.row.company-info-card-table').css('.row').css('p')[11].text,
    company.year_founded = doc.css('div.row.company-info-card-table').css('.row').css('p')[15].text,
    company.description = doc.css('div.company-info-card').css('.row').css('p')[0].text
  end

end
