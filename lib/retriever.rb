class Retriever
  def self.dog_scrape(adopt_url)
    html = open(adopt_url)
    dogs_page = Nokogiri::HTML(html)
    dogs = []
        dogs_page.css("div.panel-2col-stacked.clearfix.panel-display").each do |dog_frame|
          #:name = dog_frame.css("h1.views-field.views-field-field-dog-name.dog-name span.field-content").text
          dogs << {
              :name => dog_frame.css("h1.views-field.views-field-field-dog-name.dog-name span.field-content").text,
              :gender => dog_frame.css("div.views-field.views-field-field-dog-gender div.field-content").text
              :breed =>
              :age =>
              :color =>
              :size =>
              :housebroken =>
              :obedience =>
              :location =>
              :kids =>
              :cats =>
              :otherdogs =>
              :description =>







          }

          binding.pry
        end
    #binding.pry
    dogs
  end #dog_scrape



end #Retriever
