class CoinMarketCap::Scraper

  def self.list

    doc = Nokogiri::HTML(open("https://coinmarketcap.com/"))

    doc.search("#currencies tbody tr")[0..9].map { |coin|
      name = coin.search(".currency-name-container").text.strip
      mcap = coin.search(".market-cap").text.strip
      price = coin.search(".price").text.strip
      change = coin.search(".percent-24h").text.strip
      url = coin.search("a").attr('href') # works only with a tag
      CoinMarketCap::Coin.new(name, mcap, price, change, "https://coinmarketcap.com#{url}")
    }

  end

  def self.get_coin(coin)

    @doc = Nokogiri::HTML(open(coin.url))

    # add attribute to the coin object
    coin.volume = "$#{@doc.search(".container .coin-summary-item:nth-child(2) .coin-summary-item-detail span:first-child span:first-child").text.strip}"
    coin.cir_supply = @doc.search(".container .coin-summary-item:nth-child(4) .coin-summary-item-detail").text.strip.gsub("\n", "")
    coin.max_supply = @doc.search(".container .coin-summary-item:nth-child(5) .coin-summary-item-detail").text.strip.gsub("\n", "")
    coin.website = "www"
    coin.explorer = "explorer"
    coin.source = "source"

    coin
  end

end
