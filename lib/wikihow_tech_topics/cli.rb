require_relative 'scraper'
require 'pry'

class WikihowTechTopics::CLI

    def self.scraped_titles
        newly_scraped_for_titles = WikihowTechTopics::Scraper.scraped_title_ary

        newly_scraped_for_titles.each.with_index(1) do |title, i|
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

    def self.run_content

        newly_scraped_for_content = WikihowTechTopics::Scraper.scraped_content_array
        binding.pry 

        newly_scraped_for_content.each do |content_steps|
            puts "#{content_steps}"
        end
    end

    self.run_content







    # def to_make_pry_happy
    #     WikihowTechTopics::WikihowTechTopicModel.create_from_title_array
    # end

    # def to_make_pry_even_happier(hey)
    #     hey = 2
    #     WikihowTechTopics::Scraper.scraped_content_array(2)
    # end

    # WikihowTechTopics::Scraper.scraped_content_array(2)


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




