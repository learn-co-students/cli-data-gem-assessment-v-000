class ALSNews::Clip
  attr_accessor :date, :title, :url

  def self.today
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

    clip_1 = self.new
    clip_1.date = "December 13, 2017"
    clip_1.title = "The ALS Association Explains the Disease"
    clip_1.url = "https://alsnewstoday.com/2017/12/13/the-als-association-explains-the-disease/"

    clip_2 = self.new
    clip_2.date = "December 12, 2017"
    clip_2.title = "Who was Lou Gehrig?"
    clip_2.url = "https://alsnewstoday.com/2017/12/12/who-was-lou-gehrig-2/"

    [clip_1, clip_2]
  end



end
