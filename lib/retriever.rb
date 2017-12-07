class Retriever
  def self.dog_scrape(adopt_url)
    html = open(adopt_url)
    dogs_page = Nokogiri::HTML(html)
    dogs = []
        dogs_page.css("div.panel-2col-stacked.clearfix.panel-display").each do |dog_frame|
          #:name = dog_frame.css("h1.views-field.views-field-field-dog-name.dog-name span.field-content").text
          dogs << {
              :name => dog_frame.css("h1.views-field.views-field-field-dog-name.dog-name span.field-content").text,
              :gender => dog_frame.css("div.views-field.views-field-field-dog-gender div.field-content").text,
              :breed => 1,
              :age => 1,
              :color => 1,
              :size => 1,
              :housebroken => 1,
              :obedience => 1,
              :location => 1,
              :kids => 1,
              :cats => 1,
              :otherdogs => 1,
              :description => 1,
              :id => dog_frame.css("div.views-field.views-field-nothing-3 span.field-content").text
              :image_url => dog_frame.css("div.field-content.centerimage a").attribute("href").text







          }

          binding.pry
        end
    #binding.pry
    dogs
  end #dog_scrape



end #Retriever
