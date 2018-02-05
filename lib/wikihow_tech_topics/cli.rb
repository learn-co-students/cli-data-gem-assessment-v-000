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
        @scraped_titles_array = []
        WikihowTechTopics::WikihowTechTopicModel.all.pop(5)
        WikihowTechTopics::WikihowTechTopicModel.all.each.with_index(1) do |title, i|
            @scraped_titles_array << title.title
            puts "#{i}. #{title.title}"
            binding.pry
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
                    get_content_for_user
            end
        end
    end

    def get_content_for_user

        puts "Here's your article:"
        puts ""
        puts ""

        newly_scraped_for_content = WikihowTechTopics::Scraper.scraped_content_array
        newly_scraped_for_content.each.with_index(1) do |final_content, i|
            # parsed_content = content_parser(final_content)
            @user_input == i
                puts final_content
                # puts "#{parsed_content}"
                # binding.pry

        end       
    end
end




# WikihowTechTopics::WikihowTechTopicModel.titles_from_title_array
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



