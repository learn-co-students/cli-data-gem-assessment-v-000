dog name
("h1.views-field.views-field-field-dog-name.dog-name span.field-content").text

dog gender
("div.views-field.views-field-field-dog-gender div.field-content").text

temp = dog_frame.css("div.views-field.views-field-field-dog-gender:not(strong) div.field-content not:strong").text
temp = dog_frame.css("div.views-field.views-field-field-dog-gender div.field-content") #not further selectable, will have to split with :
