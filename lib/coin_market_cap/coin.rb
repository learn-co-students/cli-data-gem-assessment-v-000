class CoinMarketCap::Coin
  attr_accessor :name, :mcap, :price, :change, :url, :volume, :cir_supply, :max_supply, :website, :explorer, :source

  def initialize(name, mcap, price, change, url)
    @name = name
    @mcap = mcap
    @price = price
    @change = change
    @url = url
  end

  def self.add_attributes(coin, attributes)
    coin.volume = attributes[:volume]
    coin.cir_supply = attributes[:cir_supply]
    coin.max_supply = attributes[:max_supply]
    coin.website = attributes[:website]
    coin.explorer = attributes[:explorer]
    coin.source = attributes[:source]
    coin
  end
end
