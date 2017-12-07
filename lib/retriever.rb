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
              :breed => dog_frame.css("div.views-field.views-field-field-dog-breed div.field-content").text,
              :age => dog_frame.css("span.views-field.views-field-field-dog-birthdate span.date-display-interval").text,
              :color => dog_frame.css("div.views-field.views-field-field-dog-color div.field-content").text,
              :size => dog_frame.css("div.views-field.views-field-field-dog-current-size div.field-content").text,
              :housebroken => dog_frame.css("div.views-field.views-field-field-dog-housebroken div.field-content").text,
              :obedience => dog_frame.css("div.views-field.views-field-field-dog-obedience div.field-content").text,
              :location => 1,
              :kids => dog_frame.css("div.views-field.views-field-field-dog-kids div.field-content").text,
              :cats => dog_frame.css("div.views-field.views-field-field-dog-cats div.field-content").text,
              :otherdogs => dog_frame.css("div.views-field.views-field-field-dog-other-dogs div.field-content").text,
              :description => dog_frame.css("span.views-field.views-field-field-dog-description span.field-content p").text,
              :id => dog_frame.css("div.views-field.views-field-nothing-3 span.field-content").text,
              :image_url => dog_frame.css("div.field-content.centerimage a").attribute("href").text







          }

          binding.pry
        end
    #binding.pry
    dogs
  end #dog_scrape



end #Retriever
