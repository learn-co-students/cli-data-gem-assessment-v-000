#CLI Controller

require_relative './version'
require_relative './clip'


class ALSNews::CLI
  attr_accessor :clips

  def call
    puts "Recent Social Clips from ALS News Today:"
    list_clips
    url
    goodbye
  end

  def recent

  end

  def list_clips
    puts <<-DOC
      1. December 13, 2017: "The ALS Association Explains the Disease"
      2. December 12, 2017: "Who was Lou Gehrig?"
      3. December 7, 2017: "7 Things to Keep in Mind If a Loved One Has ALS"
      4. December 6, 2017: "Understanding Molecular Changes in ALS"
      5. November 30, 217: "Researcher Uses Hollywood Technology to Track ALS Speech Changes"
      6. November 29, 2017: "7 Tips For Starting an Exercise Program With ALS"
      7. November 27, 2017: "9 Ways to Manage Brain Fog"
      8. November 22, 2017: "Living with ALS: Chris Mehess's Story"
    DOC
    @clips = ALSNews::Clip.today
  end

  def url
    input = nil
    while input != "exit"
      puts "Enter (i) the number of the social clip to get its URL; (ii) list to re-list the social clips; or (iii) exit to exit"
      input = gets.strip
      case input
      when "1", "2", "3", "4", "5", "6", "7", "8"
        puts "Here's the URL for social clip #{input}:"
      when "list"
        list_clips
      end
    end
  end

  def goodbye
    puts "See you next time for more clips!!"
  end

end
