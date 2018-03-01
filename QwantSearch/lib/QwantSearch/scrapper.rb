require_relative '../QwantSearch'

#test
  class QwantSearch::Scrapper

    def initialize
    end

    def createURL(input)
      ("&t=all").prepend(input.gsub(" ","%20")).prepend("https://www.qwant.com/?q=")
    end

    def number_of_results
      @results.length
    end

    def scrap_website
      scrap_search_results
      scrap_results_descriptions
    end

    def scrap_search_results
      @results =[]
      #code to scrap and push the results in the @ results array
        #to come

      #temporary results tab
      @results =["Result 1","Result 2","Result 3","Result 4","Result 5" ]
    end

    def scrap_results_descriptions
      binding.pry
      @descriptions =[]
      #code to scrap and push the results in the @ results array
        #to come

      #temporary results tab
      @descriptions =["Description 1","Description 2","Description 3","Description 4","Description 5" ]
    end

    def display_results
      @results.each_with_index do |result, index|
        puts "#{index+1} - #{result}"
      end
    end

    def display_description(input)
      puts "#{@descriptions[input.to_i-1]}"
    end
end
