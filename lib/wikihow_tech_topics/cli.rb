require_relative 'scraper'
require_relative 'wikihow_tech_topic_model'
require 'pry'
# binding.pry

class WikihowTechTopics::CLI

    def call
        start
    end

    def start
        puts "Welcome to Wikihow Tech Topics!"
        puts ""
        puts "Review the list of articles below then \ntype the number of the article above \nthat you wish to read."
        puts ""
        run
    end

    def run
        list_titles
        get_title_for_user
        get_content_for_user
    end

    def list_titles
        scraped_for_titles = WikihowTechTopics::Scraper.scraped_title_array
        @scraped_titles_array = []
        remove_sidebar_articles = scraped_for_titles.pop(5)
        scraped_for_titles.each.with_index(1) do |title, i|
            @scraped_titles_array << title
            puts "#{i}. #{title}"
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
            end
        end
        get_content_for_user
    end

    def get_content_for_user

        puts "Here is your article:"
        puts ""
        puts ""

        newly_scraped_for_content = WikihowTechTopics::Scraper.scraped_content_array
        newly_scraped_for_content.each.with_index(1) do |final_content, i|
            parsed_content = content_parser(final_content)
            if @user_input == i
                puts "#{parsed_content}"
                # binding.pry

            end
        end       
    end

    def content_parser(content)
        content.each.with_index(1) do |method, i|
            puts "Method #{i}"
                unless i < 2
                end

                def 
        content.each.with_index(1) do |method, i|
            method.split(".").each.with_index do |step, step_num|
                puts  "#{step_num}. #{step}."
            end
        end
        end
    end
end



WikihowTechTopics::WikihowTechTopicModel.create_from_title_array

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



