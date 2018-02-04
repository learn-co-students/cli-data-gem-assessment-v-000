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
        # get_title_for_user
        # get_content_for_user
    end

    def list_titles
        puts 'ok'
        # newly_scraped_for_titles = WikihowTechTopics::WikihowTechTopicModel.create_from_title_array
        # @scraped_titles_array = []
        # newly_scraped_for_titles.each.with_index(1) do |title, i|
        #     unless title == ""
        #         @scraped_titles_array << title
        #         puts "#{i}. #{title}"
        #     end
        # end
        # puts ""
        # puts ""
    end  

    def get_title_for_user
        # user_input = gets.to_i
        # @scraped_titles_array.each.with_index(1) do |title, i|
        #     case
        #         when user_input == i
        #             puts ""
        #             puts ""
        #             puts title
        #             puts ""
        #             puts ""
        #     end
        # end
        # get_content_for_user
    end

    def get_content_for_user

        puts "Here is your article:"
        puts ""
        puts ""

        newly_scraped_for_titles = WikihowTechTopics::WikihowTechTopicModel.create_from_content_array
        # newly_scraped_for_titles.each.with_index(1) do |content, i|
        #     case
        #         when get_title_for_user == i
        #             puts ""
        #             puts ""
        #             puts content
        #             puts ""
        #             puts ""
        #         end
        #     end       
        #     binding.pry
        # puts ""
        # puts ""
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



