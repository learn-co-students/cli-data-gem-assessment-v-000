

class WikihowTechTopics::Scraper

    def self.get_content_urls
        url = "https://www.wikihow.com/Category:Selecting-and-Buying-a-Computer"
        home_page = Nokogiri::HTML(open(url))
        content_url_array = []
        content_urls = home_page.css(".thumbnail").children.css("a").map { |content_link| content_link.attribute("href").text }
        http_added_to_content_urls = content_urls.map { |content_url| "https:" + content_url }
        http_added_to_content_urls.pop(4)
        http_added_to_content_urls
    end

    def self.get_titles_from_content_urls
        url = "https://www.wikihow.com/Category:Selecting-and-Buying-a-Computer"
        home_page = Nokogiri::HTML(open(url))
        title_array = []
        titles_from_content_arrays = home_page.css(".thumbnail").children.css("a").map { |content_link| content_link.text }
        titles_from_content_arrays.pop(4)
        titles_from_content_arrays
        titles_from_content_arrays.collect do |raw_title| 
            sliced_title = raw_title.slice!(0, 53)
            raw_title
            resliced_title = raw_title[0...-1]
            resliced_title
            title_array << resliced_title
        end
        title_array
    end

    def self.scraped_content_array
        get_content_urls.map do |complete_content_url| 
            content_pages_to_scrape = Nokogiri::HTML(open(complete_content_url))
            final_scraped_content = content_pages_to_scrape.css('div.steps').map { |full_content|
                full_content.css("b").text }
                final_scraped_content
        end
    end
end