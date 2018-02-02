class CoinMarketCap::Coin
  attr_accessor :name, :mcap, :price, :change, :url, :volume, :cir_supply, :max_supply, :website, :explorer, :source

  def initialize(name, mcap, price, change, url)
    @name = name
    @mcap = mcap
    @price = price
    @change = change
    @url = url
  end
end
