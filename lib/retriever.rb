class Retriever
  def self.dog_scrape(adopt_url)
    html = open(adopt_url)
    dogs_page = Nokogiri::HTML(html)
    dogs = []
        dogs_page.css("div.panel-2col-stacked.clearfix.panel-display").each do |dog_frame|
          binding.pry
        end
  end #dog_scrape


dogs
end #Retriever
