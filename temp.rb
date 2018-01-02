#have the search key be an imaginary matching dog object, per chris. need methods to instatiate search dog object, clear, then just run the match in search session


def all_dogs_display
  DogSearchSession.cls
  Dog.all.each.with_index(offset = 1) do |dog, index|
    DogSearchSession.cls
    puts "Name: #{dog.name}"
    puts "Gender: #{dog.gender}"
    puts "Breed: #{dog.breed}"
    puts "Age: #{dog.age}"
    puts "Color: #{dog.color}"
    puts "Size: #{dog.size}"
    puts "Housebroken: #{dog.housebroken}"
    puts "Obedience Trained: #{dog.obedience}"
    puts "Living Situation: #{dog.location}"
    puts "Good with Kids? #{dog.kids}"
    puts "Good with Cats? #{dog.cats}"
    puts "Good with other dogs? #{dog.otherdogs}"
    puts "MAGSR ID#: #{dog.id}"
    puts "Image Link: #{dog.image_url}"
    puts "Description: #{dog.description}"
    puts "Press Any Key To Continue"
    gets.strip

  end
end

def user_input(num_choices)
  puts "Please enter 1 - #{num_choices}"
  input = gets.strip.to_i
  if input < 1 || input > num_choices
    puts "Invalid input.  Please choose 1 - #{num_choices}"
    input = nil
    user_input(num_choices)
  end
  input
end

def self.magsr_fixer
    self.all.each do |dog|
        dog.each do |key, value|
            if key == :gender || key == :breed || key == :color || key == :size || key==:housebroken || key == :obedience || key == :kids || key == :cats || key == :otherdogs
              dog[key] = extract_value(value)
            end
        end
    end
end

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
temp = dog_frame.css("span.views-field.views-field-field-dog-living-with span.field-content").text


         ^\
/        //o__o
/\       /  __/
\ \______\  /
\         /
\ \----\ \
 \_\_   \_\_

 /\/'-,
,--'''''   /"
____,'.  )       \___
'"""""------'"""`-----'

_
/ \`.
||  \ \
\\  |  \.:```````-.
\\_/    '-.  .:```-.
/-.\      `.   .:`-.`_
|_O.'       |     .`-. `.       _...-----.._
/`-._       .'   .'    `----'''''            `.
/      \ _.-'    /                              `.
/    .- |         |    .'                      `.  \
(_/ .'  .'.        |    '               .'        \  \
`-'`-'  ):.      |    :  /            .         |   \
      ):.    '       |__.:`..:::..|         |    \
        ):.   \      |      __.....\        |\    `:.     .`|
          ))```\      `_..-`  |     \       | \      `-_-'  /
             \ |      \       |     '       `. \        _.-'
              \|     .'       |      \       `. `.   __..-`
               |    |         \      /`.      `.  `-._.-`
               |    '          `.    |  `.      `-.
               '   .'            \  / \   `-.    / ]
             .'   .'|            /  ' ]      |  ' .'
             .'-. | |          .'  .-'       /   /
             |   \| '    _.-..'   /         /   |
            .'    |/    / .-.    /       .-'    /
         .-'      '    /_/___\__/     .'.' .'  |
       .'.' .'  ./                   ( (  (   .'
LGB      ( (  (   .'                     `-`--`-`
       `-`--`-`
