require_relative 'scraper'
require_relative 'wikihow_tech_topic_model'
require 'pry'

class WikihowTechTopics::CLI

    def call
        start
    end

    def start
        puts "Welcome to Wikihow Tech Topics!"
        puts ""
        puts "Review the list of articles,\ntype the number of the article above\nthat you wish to read, and hit return."
        puts ""
        run
    end

    def run
        list_titles
        get_title_for_user
        get_content_for_user_multiple_methods
        get_content_for_user_single_method
        option
    end

    def list_titles
        @scraped_titles_array = []
        WikihowTechTopics::WikihowTechTopicModel.all
        WikihowTechTopics::WikihowTechTopicModel.all.each.with_index(1) do |title, i|
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
                    puts "Your article ... "
                    puts ""
                    puts ""            
            end
        end
    end

    def get_content_for_user_multiple_methods
        newly_scraped_for_content = WikihowTechTopics::Scraper.scraped_content_array
        newly_scraped_for_content.each.with_index(1) do |final_content, i|
            case
            when @user_input == i && final_content.size >= 2
                    content_parser_multiple_methods(final_content)
            end
        end
    end
            
    def get_content_for_user_single_method
        newly_scraped_for_content = WikihowTechTopics::Scraper.scraped_content_array
        newly_scraped_for_content.each.with_index(1) do |final_content, i|
            case
            when @user_input == i && final_content.size == 1
                puts final_content
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


            # elsif final_content.size == 1 
            #     final_content


                # puts final_content
            #     content_parser_multiple_methods(final_content)
            #     # binding.pry
            #     # final content.each.with_index do |method, num|
            #     #     puts "Method #{num}. #{method}" unless num < 2
            #         # parsed_content = content_parser(final_content)
            # case
            #     when @user_input == i
                    
            #             binding.pry

            #         end
        
            #     when @user_input == i 
            #         if final_content.size == 1
            #             content_parser_single_method(final_content)
            #         end
                    # puts "#{parsed_content[0]}"
              



# WikihowTechTopics::CLI.get_content_for_user


WikihowTechTopics::WikihowTechTopicModel.titles_from_title_array
WikihowTechTopics::WikihowTechTopicModel.all
# WikihowTechTopics::WikihowTechTopicModel.add_content_from_content_array

    # def content_parser(content)
    #     content.each.with_index(1) do |method, i|
    #         puts "Method #{i}. #{method}"
    #             unless i < 2
    #             end
    #         end
    # end

    #             def 
    #     content.each.with_index(1) do |method, i|
    #         method.split(".").each.with_index do |step, step_num|
    #             puts  "#{step_num}. #{step}."
    #         end
    #     end
    #     end
    # end

    # def self.scraped_content
    #     newly_scraped_for_content = WikihowTechTopics::WikihowTechTopicModel.create_from_content_hash
    #     newly_scraped_for_content.each.with_index(1) do |content_steps, i|
    #         puts "#{i}. #{content_steps}"
    #     end
    # end    

    # scraped_content

    # def self.scraped_titles
    #     newly_scraped_for_titles = WikihowTechTopics::WikihowTechTopicModel.create_from_title_hash
    #     newly_scraped_for_titles.each.with_index(1) do |title, i|
    #         unless title == ""
    #             puts "#{i}. #{title}"
    #         end
    #     end
    #     puts ""
    #     puts ""
    # end  
    # scraped_titles



