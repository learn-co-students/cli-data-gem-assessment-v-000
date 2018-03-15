class Cryptonewbie::Scraper

  def get_page
    Nokogiri::HTML(open("https://coinmarketcap.com"))
  end

  def get_cryptos
    table = self.get_page.at('table#currencies')
    content = table.css('tbody')
    rows = content.css('tr')
  end

  def make_cryptos
    self.get_cryptos.collect do |coin|
      Cryptonewbie::Crypto.new_from_index_page(coin)
    end
  end
  
end
