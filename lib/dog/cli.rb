class Dog::CLI

  def call
    Dog::DogScraper.scrape_dogs
    list_dogs
    menu
  end

  def list_dogs #This will list the dogs to the user
    puts "List of Dogs"
    @dogs = Dog::DogBio.all
    @dogs.each.with_index(1) do |dog, i|
      puts "#{i}. #{dog.breed}\n "
    end
  end

  def goodbye
    puts "Thank you for stopping by! More to arrive soon!\n "
  end

  def menu
    input = nil
    while input != "exit"
      puts "Please enter a number 1-#{@dogs.length} listed for a dog's bio! Type 'list' to receive the list again and when you're finished type 'exit', thank you!\n "
      input = gets.chomp.downcase
      if input.to_i > 0 && input.to_i <= @dogs.length
        doggo = @dogs[input.to_i-1]
        puts "#{doggo.breed}\n "
        Dog::DogScraper.scrape_dog(doggo) unless doggo.bio
        puts "#{doggo.bio}\n "
      elsif input == "list"
        list_dogs
      elsif input == "exit"
        goodbye
      else
        puts "Input invalid, Please check the list again using 'list' and choose a dog 1-#{@dogs.length}. Thank you.\n "
      end
    end
  end

end #end of class
