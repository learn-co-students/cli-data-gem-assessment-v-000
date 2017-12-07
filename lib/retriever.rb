class Retriever
  def self.dog_scrape(adopt_url)
    html = open(adopt_url)
    dogs_page = Nokogiri::HTML(html)
    dogs = []
        dogs_page.css("div.panel-2col-stacked.clearfix.panel-display").each do |dog_frame|
          #:name = dog_frame.css("h1.views-field.views-field-field-dog-name.dog-name span.field-content").text

          binding.pry
        end
    dogs
  end #dog_scrape



end #Retriever
