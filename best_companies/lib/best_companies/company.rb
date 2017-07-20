class BestCompanies::Company
  attr_accessor :name, :rank, :url
  
  def self.year
    #I should return a bunch of instances of company
    puts <<-DOC.gsub /^\s+/, ""
      1. Google - #1
      2. Wegmans Food Markets - #2
    DOC

      company_1 = self.new
      company_1.name = "Google"
      company_1.rank = "#1"
      company_1.url = "http://fortune.com/best-companies/google/"

      company_2 = self.new
      company_2.name = "Wegmans Food Markets"
      company_2.rank = "#2"
      company_2.url = "http://fortune.com/best-companies/wegmans-food-markets/"

      [company_1, company_2]

  end
end
