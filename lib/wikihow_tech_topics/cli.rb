require_relative 'scraper'
require_relative 'wikihow_tech_topic_model'
require 'pry'

class WikihowTechTopics::CLI

    def call
        puts "hello"
        start
    end

    def start
        list_titles
        puts "Welcome to Wikihow Tech Topics (\"When all you want is the steps\")!"
        puts ""
        puts "Review the list of articles above,\ntype the number of the article\nthat you wish to read the steps of, and hit return."
        puts ""
        run
    end

    def run
        get_title_for_user
        get_content_for_user_multiple_methods
        get_content_for_user_single_method
    end

    def list_titles
        @scraped_titles_array = []
        WikihowTechTopics::WikihowTechTopicModel.all
        WikihowTechTopics::WikihowTechTopicModel.all.drop(1)
            @scraped_titles_array << title.title
            puts "#{i}. #{title.title}"
        end
        puts ""
        puts ""
    end  

    def get_title_for_user
        @user_input = gets.to_i
        @scraped_titles_array.each.with_index(1) do |title, i|
            case
                when @user_input == i
                    puts ""
                    puts ""
                    puts title
                    puts ""
                    puts ""
                    puts "Here are your article steps ... "
                    puts ""
                    puts ""            
            end
        end
    end

    def get_content_for_user_multiple_methods
        newly_scraped_for_content = WikihowTechTopics::WikihowTechTopicModel.all
        newly_scraped_for_content.each.with_index(1) do |final_content, i|
            case
            when @user_input == i && final_content.size >= 2
                    content_parser_multiple_methods(final_content)
                    option
            end
        end
    end
            
    def get_content_for_user_single_method
        newly_scraped_for_content = WikihowTechTopics::WikihowTechTopicModel.all
        # binding.pry
        newly_scraped_for_content.each.with_index(1) do |final_content, i|
            case
            when @user_input == i && final_content.size == 1
                puts final_content
                option
            end
        end
    end

    def content_parser_multiple_methods(content)
        content.each.with_index(1) do |method, method_num|
            puts "Method/Part #{method_num}. #{method}"
        end
    end
    
    def option

        puts ""
        puts ""
        puts "Would you like to read another article? (type y for \"yes\" and n for \"no\")"
        read_again_input = gets.strip
            if read_again_input == "y" 
                start
            else 
                puts ""
                puts ""
                puts "Goodbye for now!"
                puts ""
                puts ""
            end
    end
end

WikihowTechTopics::WikihowTechTopicModel.titles_from_title_array
WikihowTechTopics::WikihowTechTopicModel.scraped_content_array
WikihowTechTopics::WikihowTechTopicModel.content_urls

# @scraped_titles_array = []
# WikihowTechTopics::WikihowTechTopicModel.all
# WikihowTechTopics::WikihowTechTopicModel.all.each.with_index(1) do |title, i|
#     @scraped_titles_array << title.title
#     puts "#{i}. #{title.title}"
# end
