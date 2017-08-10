class BestCompanies::Company
  attr_accessor :name, :rank, :url, :location, :industry, :year_founded, :description

  @@all = []

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

  # def self.companies_founded_after(year)
  #   #return all Company objects that were founded after the year passed in - e.g. 1906
  #   self.all.each do |c|
  #     c.year_founded
  #   end
  #   "hello"
  # end
end
