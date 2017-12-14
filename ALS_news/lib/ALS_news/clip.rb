class ALSNews::Clip
  attr_accessor :date, :title, :url

  @@all = []

  def self.new_from_index(index)
    self.new(
            index.css("time").text,
            index.css("h4").css("a[href]").text,
            index.css.first("a[href]")
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
    doc.css(".pf-content").css("p").text
  end

  def self.all
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
