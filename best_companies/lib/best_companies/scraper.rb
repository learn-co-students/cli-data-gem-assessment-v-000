class BestCompanies::Scraper
  def get_page
    doc = Nokogiri::HTML(open("http://fortune.com/best-companies/list"))
  end

  def scrape_fortune
    get_page.css("ul.company-list li").each do |company|
      name = doc.css("span.company-title").text
      rank = doc.css("span.company-rank").text
      profile_url = doc.css('a').attr('href').value
    end
  end

  def scrape_profile_url(url)
    doc = Nokogiri::HTML(open("http://fortune.com/best-companies/#{url}"))
  end
end
