require 'nokogiri'
require 'open-uri'
require './lib/version'
require './lib/clip'
require './lib/clip_scraper'

#CLI Controller
class ALSNews::CLI
  attr_accessor :clips

  def call
    generate_clips
    list_clips
    ask_for_more
    goodbye
  end

  def generate_clips
    scraper = ALSNews::Clip_Scraper.new
    scraper.create_clips
    ALSNews::Clip.add_entry_number
  end

  def list_clips
    puts "Recent Social Clips from ALS News Today:"
    @clips = ALSNews::Clip.all
    @clips.each {|clip| puts "#{clip.entry_number}. #{clip.date}: #{clip.title} - #{clip.url}"}
  end

  def ask_for_more
    input = nil
    while input != "exit"
      puts "Enter (i) the number of the social clip to get its summary; (ii) search to find by keyword; (iii) list to re-list the social clips; or (iv) exit to exit"
      input = gets.strip.downcase
      case input
      when "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14"
        puts "Here's the summary of social clip #{input}:"
        @clips.each do |clip|
          if clip.entry_number == input.to_i
            puts "#{clip.summary}"
          end
        end
      when "list"
        list_clips
      when "search"
        search_by_keyword
      end
    end
  end

  def search_by_keyword
    input = nil
    while input != "exit"
      puts "What is your keyword search term? (enter exit to exit)"
      input = gets.strip.downcase
      if input != "exit"
        puts "Searching now..."
        ALSNews::Clip.find_by_keyword(input)
      end
    end
  end

  def goodbye
    puts "See you next time for more clips!!"
  end

end
