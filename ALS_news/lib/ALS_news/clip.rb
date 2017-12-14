class ALSNews::Clip
  attr_accessor :date, :title, :url

  @@all = []

  def initialize(path)

  def self.new_from_index(index)
    self.new(
            index.css("article").css("time").text
            "http://www.theworlds50best.com#{r.css("a").attribute("href").text}",
            index.css("h3").text,
            index.css("a").text
            )
  end

  def initialize(date=nil, title=nil, url=nil)
      @date = date
      @title = title
      @url = url
      @@all << self
  end

  def content
    doc = Nokogiri::HTML(open(url))
    doc.css("div#pf-content").css(".p").text
  end

  def self.all
    clip_1 = self.new
    clip_1.date = "December 13, 2017"
    clip_1.title = "The ALS Association Explains the Disease"
    clip_1.url = "https://alsnewstoday.com/2017/12/13/the-als-association-explains-the-disease/"

    clip_2 = self.new
    clip_2.date = "December 12, 2017"
    clip_2.title = "Who was Lou Gehrig?"
    clip_2.url = "https://alsnewstoday.com/2017/12/12/who-was-lou-gehrig-2/"

    @@all
  end

  def self.find_by_month(input)
    clips_from_month = []
   self.all.each do |clip|
     if clip.date.downcase.include?(input.to_s.downcase)
       clips_from_month << clip
     end
   end
   puts "Following are clips from #{input}:"
   clips_from_month.each.with_index(1) do |clip, i|
     puts "#{i}. #{clip.date}: #{clip.title} - #{clip.url}"
   end
  end

  def self.find_by_keyword(input)
    clips_with_keyword = []
   self.all.each do |clip|
     if clip.content.downcase.include?(input.to_s.downcase)
       clips_with_keyword << clip
     end
   end
   puts "Following are clips with keyword #{input}:"
   clips_with_keyword.each.with_index(1) do |clip, i|
     puts "#{i}. #{clip.date}: #{clip.title} - #{clip.url}"
   end
  end

end
