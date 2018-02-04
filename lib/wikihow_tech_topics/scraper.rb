require 'nokogiri'
# binding.pry
require 'open-uri'
require 'pry'

class WikihowTechTopics::Scraper

    def self.scraped_title_array
        home_page = Nokogiri::HTML(open("https://www.wikihow.com/Category:Selecting-and-Buying-a-Computer"))
        title_array = []
        binding.pry

        home_page.css('div#bodycontents').children('.thumbnail').each do |title_info|
            title_info_for_hash = title_info.css('span').text
binding.pry
            title_array << {title: title_info_for_hash} 
            # home_page.css('.text').each do |title_info|
            #     title_info_for_hash = title_info.css('span').text
            #     title_array << {title: title_info_for_hash} 
    
        end
        title_array
    end

    def self.scraped_content_array
        url = "https://www.wikihow.com/Category:Selecting-and-Buying-a-Computer"
        home_page = Nokogiri::HTML(open(url))
        content_array = []
        # content_urls = home_page.css(".thumbnail").children.css("a").map { |content_link| content_link.attribute("href").text }

        content_urls = home_page.css(".thumbnail").children.css("a").map { |content_link| content_link.attribute("href").text }

        http_added = content_urls.map { |content_url| "https:" + content_url }

        http_added.map do |complete_content_url| 
            content_pages_to_scrape = Nokogiri::HTML(open(complete_content_url))
        
        final_scraped_content = content_pages_to_scrape.css('div.steps').map { |full_content|
                full_content.css("b").text }
        
        content_array << final_scraped_content
            end
        content_array
    end
end


# Question: Why did a below not need an argument of url but the current way does? (is the differenc each and map)? And was using each the reason I only got one link and a time and not all of the links scraped?)

# test_array = [{'title' => 'how to text', 'content' => 'just do it'}], {'title' => 'how to email', 'content' => 'just do it, too'}]


# home_page.css(".thumbnail").each do |content_url|
#     content_url.css("a").attribute("href").text

# scraped_content_ary = []

# scraped_content_url = content_url.css("a").attribute("href").text

# scraped_content_ary << "https:" + scraped_content_url

# scraped_content_ary.each do |complete_content_url|
#     content_page = Nokogiri::HTML(open(complete_content_url))

# content_page.css('div.steps').each do |full_content|
#     full_content.css("b").text
#     @content_array << full_content.css("b").text
#     binding.pry

    # def initialize
    #     @title_hash_array = []
    # end
    # @title_array = []

    #     students = []
    #     index_page.css("div.roster-cards-container").each do |card|
    #       card.css(".student-card a").each do |student|
    #         student_profile_link = "./fixtures/student-site/#{student.attr('href')}"
    #         student_location = student.css('.student-location').text
    #         student_name = student.css('.student-name').text
    #         students << {name: student_name, location: student_location, profile_url: student_profile_link}
    #       end
    #     end
    #     students
    #   end

        # final_scraped_content.each do |steps|
        #     content_hash[:content] = steps
