require 'pry'

class CLI

    def call
        puts "Welcome to Wikihow Tech Topics"
        puts ""
        puts "Type the number of the article you wish to read."
        # puts "#{title.index}. #{self.create_article}"
    end
    run
    end
    
    def run
        create_article
        title_array
    end

    def self.create_article
        new_article = Scraper.new
        new_article.each do |a
    
    end

    def self.title_list
        
        iterate over new article and put title keys in an array
        make title key visible
    end 

    def self.user_gets_title
   
        article_number = gets.strip
    end

        
    def display_title
        access the index of each article title
        if article_number == index of article title
            put article content
    end
end

        # contacts.each do |person, contact_details_hash|
        #     contact_details_hash.each do |attribute, data|
        #       if attribute == :favorite_ice_cream_flavors
        
