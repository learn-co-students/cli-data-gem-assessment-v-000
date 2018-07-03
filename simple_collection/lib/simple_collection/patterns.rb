class Pattern

  attr_accessor :name, :url, :size, :materials, :gauge, :suggested_needles, :notes, :description

  @@all = []
  
  def scrape_pattern
    doc = Nokogiri::HTML(open("http://tincanknits.com/#{url}"))
    #puts doc.css("p")
    #stuff = doc.css("tr td a img.img-thumbnail-tight")
    @size = doc.css("div.LHbox table")[1].css("tr")[0].css("td")[1].text
    # test size = doc.css("div.LHbox table")[1].css("tr")[0]
    @materials = doc.css("div.LHbox table")[1].css("tr")[1].css("td")[1].text
    @gauge = doc.css("div.LHbox table")[1].css("tr")[2].css("td")[1].text
    @suggested_needles = doc.css("div.LHbox table")[1].css("tr")[3].css("td")[1].text
    @notes = doc.css("div.LHbox table")[1].css("tr")[4].css("td")[1].text
    @description = doc.css("div.LHbox blockquote p").text
  end

  def initialize(name=nil, url=nil)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end


end
