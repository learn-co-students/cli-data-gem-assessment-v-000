#CLI Controller

require_relative './version'

class ALSNews::CLI
  def call
    puts "Social Clips from ALS News Today:"
  end

  def list_news
    puts <<-DOC
      December 13, 2017: The ALS Association Explains the Disease
      December 12, 2017: Who was Lou Gehrig?
      December 7, 2017: 7 Things to Keep in Mind If a Loved One Has ALS
      December 6, 2017: Understanding Molecular Changes in ALS
      November 30, 217: Researcher Uses Hollywood Technology to Track ALS Speech Changes
      November 29, 2017: 7 Tips For Starting an Exercise Program With ALS
      November 27, 2017: 9 Ways to Manage Brain Fog
      November 22, 2017: Living with ALS: Chris Mehess's Story
    DOC
  end

end
