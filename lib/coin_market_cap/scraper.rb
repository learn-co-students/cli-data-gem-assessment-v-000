class CoinMarketCap::Scraper

  def self.list

    coin1 = CoinMarketCap::Coin.new
    coin1.name = "bitcoin"
    coin1.mcap = "100000000"
    coin1.price = "10000"
    coin1.change = "10"
    coin1.url = "https://coinmarketcap.com/currencies/bitcoin/"


    coin2 = CoinMarketCap::Coin.new
    coin2.name = "Ethereum"
    coin2.mcap = "50000000"
    coin2.price = "900"
    coin2.change = "-10"
    coin2.url = "https://coinmarketcap.com/currencies/ethereum/"

    [coin1, coin2]

  end

  def self.get_coin(coin)
    # check if attribute exist from previous object
    if coin.website.nil?
      # if not scrape
      data = { :volume => 555,
        :cir_supply => 10,
        :max_supply => 20,
        :website => "www.google.com",
        :explorer => "explorer.com",
        :source => "source.com"
      }

      # add attribute to the coin object
      coin.volume = data[:volume]
      coin.cir_supply = data[:cir_supply]
      coin.max_supply = data[:max_supply]
      coin.website = data[:website]
      coin.explorer = data[:explorer]
      coin.source = data[:source]

    end
    coin
  end

end
