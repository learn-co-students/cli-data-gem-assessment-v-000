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
			Enter the name of dog you want to see the popularity of! Or type Exit to leave the program.
			DOC
			input = gets.strip.downcase

      if input.to_i > 0 && input.to_i < 11
  				index = input.to_i-1
  				puts ""
  				puts Dogs::DogsPopularity.all[index].name
  				puts ""

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
