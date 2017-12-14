class ALSNews::Clip
  attr_accessor :date, :title, :url

  def self.today
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
