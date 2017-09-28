class AmazonTool::Category

  attr_accessor :name, :items

  @@all = []

  def initialize
    @@all << self
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def self.all
    @@all
  end

  def scrape_price(item)
    #### finds the price corresponding to the already found products.

      # provides location of url for different product categories - Amazon would not allow redirect through the previously scraped url.
    pricing_url_hash = {
      :toys_and_games => "https://www.amazon.com/Best-Sellers-Toys-Games/zgbs/toys-and-games/",
      :electronics => "https://www.amazon.com/Best-Sellers-Electronics/zgbs/electronics",
      :camera_and_photo => "https://www.amazon.com/Best-Sellers-Camera-Photo/zgbs/photo/",
      :video_games => "https://www.amazon.com/Best-Sellers-Video-Games/zgbs/videogames/",
      :book => "https://www.amazon.com/Best-Sellers-Books-Amazon/zgbs/books/",
      :fashion => "https://www.amazon.com/Best-Sellers/zgbs/fashion/"
    }

      # sets the pricing variable to the correct category url
    case item.category.name
      when "Toys & Games"
        pricing = Nokogiri::HTML(open(pricing_url_hash[:toys_and_games]))
      when "Electronics"
        pricing = Nokogiri::HTML(open(pricing_url_hash[:electronics]))
      when "Camera & Photo"
        pricing = Nokogiri::HTML(open(pricing_url_hash[:camera_and_photo]))
      when "Video Games"
        pricing = Nokogiri::HTML(open(pricing_url_hash[:video_games]))
      when "Books"
        pricing = Nokogiri::HTML(open(pricing_url_hash[:book]))
      when "Clothing, Shoes & Jewelry"
        pricing = Nokogiri::HTML(open(pricing_url_hash[:fashion]))
    end

      # scrapes actual prices on page, location in array relates to index of items.
    prices = pricing.search('span.p13n-sc-price')
    if item.index == 0
      item.price =  prices[0].text
    elsif item.index == 1
      item.price = prices[1].text
    elsif item.index == 2
      item.price = prices[2].text
    end
  end

  def remove_last_item
    @items.pop
  end

end
