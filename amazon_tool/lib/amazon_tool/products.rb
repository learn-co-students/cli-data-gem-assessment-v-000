class AmazonTool::Products

  attr_accessor :category

  def initialize(category)
    @category = category
  end

  def self.all
    puts <<-DOC.gsub /^\s*/, ''
    1. WowWee Fingerlings Mia Purple Baby Monkey with Bonus Stand
    2. WowWee Fingerlings Zoe Turquoise Baby Monkey with Bonus Stand
    3. WowWee Fingerlings Finn Baby Monkey Black with Bonus Stand
    DOC

    product_1 = self.new
    product_1.name = "WowWee Fingerlings Mia Purple Baby Monkey with Bonus Stand"
    product_1.price = "$7"
    product_1.availability = true
    product_1.url = 'www.amazon.com'

    product_2 = self.new
    product_2.name = "WowWee Fingerlings Mia Turqouise Baby Monkey with Bonus Stand"
    product_2.price = "$8.50"
    product_2.availability = true
    product_2.url = 'www.amazon.com'

    [product_1, product_2]

  end



end
