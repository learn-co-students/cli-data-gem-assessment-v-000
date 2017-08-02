class BestCompanies::Company
  attr_accessor :name, :rank, :url, :location, :industry, :year_founded, :description

  @@all = []

  def self.new_from_index_page(c)
   self.new(
      c.css("span.company-title").text,  #name
      c.css("span.company-rank").text, #rank
      "http://fortune.com/#{c.css("a").attribute("href").text}"
      )
 end

  def initialize(name=nil, rank=nil, url=nil)
    @name =  name
    @rank =  rank
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def location
    @location ||= doc.css('div.row.company-info-card-table').css('.row').css('p')[5].text

  end

  def industry
    @industry ||= doc.css('div.row.company-info-card-table').css('.row').css('p')[11].text
  end

  def year_founded
    @year_founded ||= doc.css('div.row.company-info-card-table').css('.row').css('p')[15].text
  end

  def description #NEED TO BE DESCRIPTION
    @description ||= doc.css('div.company-info-card').css('.row').css('p')[0].text
    #pageContent > div.F500-item-page.bestcos.container > div.F500-body-container > div > div.company-info-card > div > div.small-12.large-7.columns.bg-white.company-info-c > div:nth-child(1) > div > span > p:nth-child(1)

  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end
