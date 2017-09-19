class AmazonTool::Products

  attr_accessor :name, :price, :availability, :url, :all


  def self.all
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

    return [product_1, product_2]
  end
end
