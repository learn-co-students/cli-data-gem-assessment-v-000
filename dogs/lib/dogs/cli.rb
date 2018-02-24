class Dogs::CLI

  def call
    puts ""
    Dogs::Scraper.scrape_dogs
    list_dogs
    menu
    binding.pry
  end

  def list_dogs
    Dogs::DogsPopularity.all.each do |dog|
      puts "#{dog.name}"
    end
  end

  def menu
		input = nil
		while input != "exit"
			puts <<-DOC.gsub /^\s+/, ""
			Enter a number 1-20 to see the dogs popularity and best quality!
      Or type "List" to see the list of dogs again
      Or type "Exit" to leave the program!
			DOC
			input = gets.strip.downcase

      if input.to_i > 0 && input.to_i < 21
				index = input.to_i-1
				puts ""
				puts Dogs::DogsPopularity.all[index].name
        puts "#{Dogs::DogsPopularity.all[index].popularity}th most popular family dog!"
        puts "Best quality = #{Dogs::DogsPopularity.all[index].temper}"
				puts ""

      elsif input == "list"
        list_dogs

			elsif input == "exit"
				goodbye

			else
				puts "I don't see that option here...please choose from the list below"
			end
		end
	end

	def goodbye
		puts "          Thank you for stopping by! Have a wonderful day!"

	end

end
