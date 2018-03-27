class Dogs::CLI


  def call
    puts " "
    puts "Welcome to family friendly dog rankings!"
    puts " "
  #  puts "Enter a number 1-20 to see the ranking of popularity for a family friendly dog, also the breeds best quality!"
    puts " "
    Dogs::Scraper.scrape_dogs
    list_dogs
    menu
  end

  def list_dogs
    input = nil
    puts "Which list would you like to see A or B"
    input = gets.strip.downcase
    puts " "

     if input == "a"
       counter = 0
      Dogs::DogsPopularity.all.each do |dog|
        if counter >= 0 && counter <= 9
          puts "#{counter +=1}. #{dog.name}"
        end
      end
      puts ""
      puts ""
        puts "Enter a number 1-10 to see the ranking of popularity for a family friendly dog, also the breeds best quality!"

    elsif input == "b"
      counter = 21
      Dogs::DogsPopularity.all.reverse.each do |dog|
        if counter <= 21 && counter >= 12
          puts "#{counter -=1}"" #{dog.name}"
        end
      end
      puts ""
      puts ""
      puts "Enter a number 11-20 to see the ranking of popularity for a family friendly dog, also the breeds best quality!"
    end
    puts ""
    puts ""
  end

  def menu
		input = nil
		while input != "exit"
      puts " "
      puts " "
			puts <<-DOC.gsub /^\s+/, ""
      Enter another number 1-10 or 11-20!
      Type "List" to see the list of dogs again!
      Type "Exit" to leave the program!
			DOC
      puts " "
      input = gets.strip.downcase
      puts " "

      if input.to_i > 0 && input.to_i < 21
				index = input.to_i-1
  				puts ""
  				puts "#{Dogs::DogsPopularity.all[index].name}:"
          puts "Family dog ranking =  ##{Dogs::DogsPopularity.all[index].popularity}!"
          puts "Best quality = #{Dogs::DogsPopularity.all[index].temper}"
  				puts ""

      elsif input == "list"
        list_dogs

			elsif input == "exit"
				goodbye

			else
				puts "I don't see that option here...please choose from the list below"
        puts " "
        list_dogs
			end
		end
	end

	def goodbye
		puts "          Thank you for stopping by! Have a wonderful day!"
	end
end
