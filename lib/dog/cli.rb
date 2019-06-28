class Dog::CLI

  def call
    list_dogs
    menu
    # goodbye
  end

  def list_dogs
    puts "List of Dogs"
    @dogs = Dog::DogScraper.list
    @dogs.each.with_index(1) do |dog, i|
      puts "#{i}. #{dog.breed}"
    end
  end

  def list_bios
    puts "All Dog Bios"
    @dogs = Dog::DogScraper.list
    @dogs.each.with_index(1) do |dog, i|
      puts "#{i}. #{dog.breed}, #{dog.bio}"
    end
  end

  def eskimo_bio
    puts "American Eskimo Dog Bio"
    @dogs = Dog::DogScraper.list
    @dogs.select.with_index(1) do |dog, i|
      if i == 1
        puts "#{dog.bio}"
      end
    end
  end

  def pug_bio
    puts "Pug Bio"
    @dogs = Dog::DogScraper.list
    @dogs.select.with_index(1) do |dog, i|
      if i == 2
        puts "#{dog.bio}"
        # puts "#{i == 2}. #{dog.bio}".slice("#{dog.bio}")
      end
    end
  end

  def bernese_bio
    puts "Bernese Mountain Dog Bio"
    @dogs = Dog::DogScraper.list
    @dogs.select.with_index(1) do |dog, i|
      if i == 3
        puts "#{dog.bio}"
      end
    end
  end

  def bulldog_bio
    puts "Bulldog Bio"
    @dogs = Dog::DogScraper.list
    @dogs.select.with_index(1) do |dog, i|
      if i == 4
        puts "#{dog.bio}"
      end
    end
  end

  def goodbye
    puts "Thank you for stopping by! More to arrive soon!"
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter a dog's breed to get to know more about that dog! Enter 'Bio' to see all the bios! Enter 'List' to see the list of dogs. If you would like to exit please type 'Exit'"
      input = gets.chomp.downcase

      if input.to_i > 0
        doggo = @dogs[input.to_i-1]
        puts "#{doggo.breed}"
      elsif input.downcase == "american eskimo dog"
        eskimo_bio
      elsif input.downcase == "pug"
        pug_bio
      elsif input.downcase == "bernese mountain dog"
        bernese_bio
      elsif input.downcase == "bulldog"
        bulldog_bio
      elsif input.downcase == "bio"
        list_bios
      elsif input.downcase == "list"
        list_dogs
      elsif input.downcase == "exit"
        goodbye
      else
        puts "Input invalid, check the spelling before entering. Type 'List' to see the list of dogs again."
      end
    end
  end


end
