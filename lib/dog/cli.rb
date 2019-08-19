class Dog::CLI

  def call
    Dog::DogScraper.scrape_dogs
    list_dogs
    menu
    # goodbye
  end

  def list_dogs #This will list the dogs to the user
    puts "List of Dogs"
    @dogs = Dog::DogBio.all
    @dogs.each.with_index(1) do |dog, i|
      puts "#{i}. #{dog.breed}\n "
    end
  end

  # def list_bios #This will list the dog bios to the user
  #   puts "All Dog Bios"
  #   @dogs = Dog::DogScraper.list
  #   @dogs.each.with_index(1) do |dog, i|
  #     puts "#{i}. #{dog.breed}, #{dog.bio}"
  #   end
  # end

  # def eskimo_bio
  #   puts "American Eskimo Dog Bio"
  #   @dogs = Dog::DogScraper.list
  #   @dogs.select.with_index(1) do |dog, i|
  #     if i == 1
  #       puts "#{dog.bio}"
  #     end
  #   end
  # end
  #
  # def pug_bio
  #   puts "Pug Bio"
  #   @dogs = Dog::DogScraper.list
  #   @dogs.select.with_index(1) do |dog, i|
  #     if i == 2
  #       puts "#{dog.bio}"
  #       # puts "#{i == 2}. #{dog.bio}".slice("#{dog.bio}")
  #     end
  #   end
  # end
  #
  # def bernese_bio
  #   puts "Bernese Mountain Dog Bio"
  #   @dogs = Dog::DogScraper.list
  #   @dogs.select.with_index(1) do |dog, i|
  #     if i == 3
  #       puts "#{dog.bio}"
  #     end
  #   end
  # end
  #
  # def bulldog_bio
  #   puts "Bulldog Bio"
  #   @dogs = Dog::DogScraper.list
  #   @dogs.select.with_index(1) do |dog, i|
  #     if i == 4
  #       puts "#{dog.bio}"
  #     end
  #   end
  # end

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
      # elsif input.downcase == "american eskimo dog"
      #   eskimo_bio
      # elsif input.downcase == "pug"
      #   pug_bio
      # elsif input.downcase == "bernese mountain dog"
      #   bernese_bio
      # elsif input.downcase == "bulldog"
      #   bulldog_bio
      # elsif input.downcase == "bio"
      #   list_bios
      elsif input.downcase == "list"
        list_dogs
      elsif input.downcase == "exit"
        goodbye
      else
        puts "Input invalid, Please check the list again using 'list' and choose a dog 1-#{@dogs.length}. Thank you.\n "
      end
    end
  end

end #end of class
