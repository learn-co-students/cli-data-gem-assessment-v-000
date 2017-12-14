#CLI Controller

require './lib/ALS_news/version'
require './lib/ALS_news/clip'
require './lib/ALS_news/clip_scraper'



class ALSNews::CLI
  attr_accessor :clips

  def call
    list_clips
    content
    goodbye
    print clips
  end

  def recent

  end

  def list_clips
    puts "Recent Social Clips from ALS News Today:"
    @clips = ALSNews::Clip.today
    @clips.each.with_index(1) do |clip, i|
      puts "#{i}. #{clip.date}: #{clip.title} - #{clip.url}"
    end
  end

  def content
    input = nil
    while input != "exit"
      puts "Enter (i) the number of the social clip to get its summary; (ii) list to re-list the social clips; or (iii) exit to exit"
      input = gets.strip.downcase
      case input
      when "1", "2", "3", "4", "5", "6", "7", "8"
        puts "Here's the summary of social clip #{input}:"
      when "list"
        list_clips
      end
    end
  end

  def goodbye
    puts "See you next time for more clips!!"
  end

end
