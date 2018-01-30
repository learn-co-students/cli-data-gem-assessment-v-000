require_relative 'scraper'
require 'pry'

class WikihowTechTopics::CLI

    def scraped_titles
        newly_scraped = WikihowTechTopics::Scraper.get_title_ary

        newly_scraped.each.with_index(1) do |title, i|
            puts "#{i}. #{title}"
           
        title_input = gets.strip

        if title_input == i
            run_content# then get related content
        end
    end
    end
    # binding.pry

    def call
        start
    end

    def start
        puts "Welcome to Wikihow Tech Topics"
        puts ""
        puts "Type the number of the article you wish to read."
        puts ""
        scraped_titles
    end

    def run_content
        # get related content
    end


    # def scraped_site_title
    #     test_array1 = ['how to text', 'how to email']
    #     test_array1.each.with_index {|title, index|
    #         puts "#{index+1}. #{title}" 
    # }
    # end

    # def scraped_site_content
    #     test_array2 = [{'content' => 'just do it'}, {'content' => 'just do it, too'}]
    #         test_array2.collect do |content_hash|
    #             content_hash.each.with_index {|content, index|
    #             input = gets.strip
    #             if input == index
    #                 puts "#{content}" 
    #             end 
    #         }
    #         end
    # end

end




