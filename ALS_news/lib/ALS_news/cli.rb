#CLI Controller
require 'pry'
require './lib/ALS_news/version'
require './lib/ALS_news/clip'
require './lib/ALS_news/clip_scraper'



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
      puts "Enter (i) the number of the social clip to get its summary; (ii) list to re-list the social clips; or (iii) exit to exit"
      input = gets.strip.downcase
      case input
      when "1", "2", "3", "4", "5", "6", "7", "8"
        puts "Here's the summary of social clip #{input}:"
        @clips.each do |clip|
          if clip.entry_number == input.to_i
            puts "#{clip.summary}"
          end
        end
      when "list"
        list_clips
      end
    end
  end

  def goodbye
    puts "See you next time for more clips!!"
  end

end
