require_relative '../QwantSearch'
  class QwantSearch::Scrapper

    def initialize
    end

    def number_of_results
      5
    end

    def results (input)
      puts "1 - Result 1"
      puts "2 - Result 2"
      puts "3 - Result 3"
      puts "4 - Result 4"
      puts "5 - Result 5"
    end

    def description(input)
      puts "Description article #{input}"
    end
end
