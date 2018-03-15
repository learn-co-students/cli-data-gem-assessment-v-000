class Cryptonewbie::Crypto
  attr_accessor :name, :price, :circulating_supply, :change
  @@all = []

  def self.new_from_index_page(coin)
    if coin.css("td.text-center").text.strip.to_i < 6
      self.new(
      coin.css("a.currency-name-container").text,
      coin.css("a.price").text,
      coin.css("td.no-wrap.text-right.circulating-supply a span:nth-child(1)").text,
      coin.css("td.no-wrap.percent-change").text
      )
    end
  end

  def initialize(name = nil, price = nil, circulating_supply = nil, change = nil)
    @name = name
    @price = price
    @circulating_supply = circulating_supply
    @change = change
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def self.find_by_name(name)
    self.all.detect do |crypto|
      crypto.name.downcase.strip == name.downcase.strip
    end
  end

end
