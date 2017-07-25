# class BestCompanies::Scraper
#
#   def scrape_index_page(index_url)
#     doc = Nokogiri::HTML(open("http://fortune.com/best-companies/"))
#
#     companies = []
#
#     doc.css("ul.company-list li").each do |company|
#     companies << {
#     :name => company.css("span.company-title").text,
#     :rank => company.css("span.company-rank").text,
#     :profile_url => company.css('a').attr('href').value
#     }
#     end
#     companies
#   end
#
#   # def scrape_profile_url(url)
#   #   scraper = Nokogiri::HTML(open("http://fortune.com/best-companies/#{url}"))
#   # end
# end
