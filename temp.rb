dog name
("h1.views-field.views-field-field-dog-name.dog-name span.field-content").text

dog gender
("div.views-field.views-field-field-dog-gender div.field-content").text

temp = dog_frame.css("div.views-field.views-field-field-dog-gender").text
temp = dog_frame.css("div.views-field.views-field-field-dog-gender div.field-content") #not further selectable, will have to split with :
temp = dog_frame.css("div.field-content.centerimage a").attribute("href").text #save
temp = dog_frame.css("div.views-field.views-field-nothing-3 span.field-content").text
temp = dog_frame.css("span.views-field.views-field-field-dog-description span.field-content p").text
temp = dog_frame.css("div.views-field.views-field-field-dog-other-dogs div.field-content").text
temp = dog_frame.css("div.views-field.views-field-field-dog-cats div.field-content").text
temp = dog_frame.css("div.views-field.views-field-field-dog-kids div.field-content").text
temp = dog_frame.css("div.views-field.views-field-field-dog-obedience div.field-content").text
temp = dog_frame.css("div.views-field.views-field-field-dog-current-size div.field-content").text
temp = dog_frame.css("div.views-field.views-field-field-dog-housebroken div.field-content").text
temp = dog_frame.css("div.views-field.views-field-field-dog-color div.field-content").text
temp = dog_frame.css("span.views-field.views-field-field-dog-birthdate span.date-display-interval").text
temp = dog_frame.css("div.views-field.views-field-field-dog-breed div.field-content").text
