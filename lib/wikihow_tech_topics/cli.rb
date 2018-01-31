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
        puts "Review the list of articles above then \ntype the number of the article above \nthat you wish to read."
        puts ""
    end

    def self.scraped_titles
        newly_scraped_for_titles = WikihowTechTopics::WikihowTechTopicModel.create_from_title_array
        newly_scraped_for_titles.each.with_index(1) do |title, i|
            unless title == ""
                puts "#{i}. #{title}"
            end      
        end
        puts ""
    end
    
    scraped_titles

    def self.scraped_content
        newly_scraped_for_content = WikihowTechTopics::WikihowTechTopicModel.create_from_content_array

        newly_scraped_for_content.each.with_index(1) do |content_steps, i|
            puts "#{i}. #{content_steps}"
        end
    end    
end




