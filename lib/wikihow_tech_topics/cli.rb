class WikihowTechTopics::CLI

    def initialize
        newly_scraped_page = WikihowTechTopics::Scraper.new
        newly_scraped_page.scraped_home_page.collect do |title|
            

        
        creates a new instance of scraper
        I need to access an instance of the scraped title

        that instance should include title from a hash 
        that instance should include content from a hash

    end

    def call
        start
    end

    def start
        puts "Welcome to Wikihow Tech Topics"
        puts ""
        puts "Type the number of the article you wish to read."
        puts ""
        WikihowTechTopics::WikihowTechTopicModel.all.each.with_index {|title, i|
            puts '#{i}. {wikihow_tech_topic_model.title}'
        }

        
        this should include all of the instances of title (scraped from index page)



    end
end

    # def run
    #     scraped_site_title
    #     # scraped_site_content
    # end

    # def create
    #     new_article = CLI.new
    # end

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






